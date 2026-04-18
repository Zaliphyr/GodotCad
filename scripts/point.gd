class_name Point
extends Node2D

var color: Color = Color.WHITE
var radius: int = 4
var list: ListItem
var highlight_from_mouse: bool = false
var highlight_from_list: bool = false
var label: String
var is_initialized: bool = false
var highlighted: bool = false

func _draw() -> void:
	draw_circle(Vector2.ZERO, radius, color)

func _ready() -> void:
	list.setup(self)
	assert(is_initialized, "Point has not been initialized!")

func setup(n: String, p: Vector2, l: ListItem) -> void:
	label = n
	global_position = p
	list = l
	is_initialized = true

func _process(delta: float) -> void:
	var mouse_pos = get_global_mouse_position()
	var distance = global_position.distance_to(mouse_pos)
	if distance < 30:
		if !highlight_from_mouse:
			highlight_from_mouse = true
			_update_highlight()
	else:
		if highlight_from_mouse:
			highlight_from_mouse = false
			_update_highlight()

func set_highlight(on: bool) -> void:
	highlight_from_list = on
	_update_highlight()

func _update_highlight() -> void:
	var should_highlight = highlight_from_list or highlight_from_mouse
	
	if should_highlight:
		color = Color.RED
		list.set_highlight(true)
		highlighted = true
	else:
		color = Color.WHITE
		list.set_highlight(false)
		highlighted = false
	
	queue_redraw()
