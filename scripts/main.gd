class_name Main
extends Node2D

var point = preload("res://Scenes/point.tscn")
var line = preload("res://Scenes/line.tscn")
var listItem = preload("res://Scenes/ListItem.tscn")
var tool: String = ""
var pointCount: int = 0
var lineCount: int = 0
@onready var ui: MainUi = $CanvasLayer/MainUi
@onready var camera: Camera2D = $Camera2D

var items: Array

func _ready() -> void:
	create_point(Vector2.ZERO)
	create_point(Vector2(-100, -100))
	create_point(Vector2(100, -100))
	create_line(items[1], items[2])

const CLICK_TIME:  int   = 250 # 1/4 second.
const CLICK_RANGE: float = 5.0 # pixels
var mouse_down_pos: Vector2
var mouse_down_time: int

func create_point(pos: Vector2) -> void:
	var new_point: Point = point.instantiate()
	var new_listItem: ListItem = listItem.instantiate()
	new_point.setup("Point" + str(pointCount), pos, new_listItem)
	pointCount += 1
	new_listItem.setup(new_point)
	self.add_child(new_point)
	items.append(new_point)
	ui.list_container.add_child(new_listItem)

func create_line(point1: Point, point2: Point) -> void:
	var new_line: Line = line.instantiate()
	var new_listItem: ListItem = listItem.instantiate()
	new_line.setup(new_listItem, point1, point2, "Line" + str(lineCount))
	lineCount += 1
	new_listItem.setup(new_line)
	self.add_child(new_line)
	items.append(new_line)
	ui.list_container.add_child(new_listItem)
	

func _unhandled_input(e: InputEvent) -> void:
	if e is InputEventMouseButton:
		if e.button_index == MOUSE_BUTTON_LEFT:
			if e.pressed:
				mouse_down_pos  = get_global_mouse_position()
				mouse_down_time = Time.get_ticks_msec()
			elif get_global_mouse_position().distance_to(mouse_down_pos) < CLICK_RANGE:
				var hold_time = Time.get_ticks_msec() - mouse_down_time
				if hold_time < CLICK_TIME:
					_handle_mouse_click(mouse_down_pos)
				else:
					_handle_mouse_long_click(mouse_down_pos, hold_time)
			#else:
				#_handle_mouse_down(mouse_down_pos)
				#_handle_mouse_up(e.position)
	elif e is InputEventKey:
		if e.key_label == KEY_LEFT:
			camera.global_position.x -= 10
		elif  e.key_label == KEY_RIGHT:
			camera.global_position.x += 10
		elif  e.key_label == KEY_UP:
			camera.global_position.y -= 10
		elif  e.key_label == KEY_DOWN:
			camera.global_position.y += 10
			
	
func _handle_mouse_click(pos: Vector2) -> void:
	if tool == "point":
		print("mouse global: ", pos)
		print("main global: ", global_position)
		print("main scale: ", scale)
		print("main rotation: ", rotation)
		create_point(pos)
		

func _handle_mouse_long_click(pos: Vector2, msec: int) -> void:
	#print("Got a long (" + str(msec) + "ms) click at " + str(pos))
	pass
