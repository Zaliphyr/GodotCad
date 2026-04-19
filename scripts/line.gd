class_name Line
extends Item

var is_initialized: bool = false
var point1: Point 	
var point2: Point
var color: Color = Color.WHITE
@onready var line: Line2D = $Line2D

func setup(l: ListItem, p1: Point, p2: Point, la: String):
	point1 = p1
	point2 = p2
	label = la
	list = l
	is_initialized = true

func _ready() -> void:
	assert(is_initialized, "Point has not been initialized!")
	line.add_point(point1.global_position)
	line.add_point(point2.global_position)
	line.width = 1

func set_highlight(on: bool):
	list.set_highlight(on)
	if on:
		line.default_color = Color.RED
		highlighted = true
	else:
		line.default_color = color
		highlighted = false
