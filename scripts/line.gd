class_name Line
extends Line2D

var list: ListItem
var is_initialized: bool = false
var point1: Point
var point2: Point
var label: String
var color: Color = Color.WHITE

func setup(l: ListItem, p1: Point, p2: Point, la: String):
	point1 = p1
	point2 = p2
	label = la
	add_point(point1.global_position)
	add_point(point2.global_position)
	width = 1
	list = l
	is_initialized = true

func _ready() -> void:
	assert(is_initialized, "Point has not been initialized!")

func set_highlight(on: bool):
	list.set_highlight(on)
	if on:
		default_color = Color.RED
	else:
		default_color = color
