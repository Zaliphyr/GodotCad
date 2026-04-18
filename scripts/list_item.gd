class_name ListItem
extends Panel

var belongsTo
@onready var label: Label = $Label
var listItem = preload("res://Scenes/ListItem.tscn")

var is_initialized: bool = false

func setup(o):
	belongsTo = o
	is_initialized = true

func _ready() -> void:
	label.text = belongsTo.label
	assert(is_initialized, "Point has not been initialized!")

func set_highlight(on: bool):
	var styleBox: StyleBoxFlat = StyleBoxFlat.new()
	if on:
		#styleBox.set("bg_color", Color.BLACK)
		styleBox.bg_color = Color.RED
	else:
		styleBox.set("bg_color", Color("999999"))
	
	add_theme_stylebox_override("panel", styleBox)

func _on_mouse_entered() -> void:
	belongsTo.set_highlight(true)


func _on_mouse_exited() -> void:
	belongsTo.set_highlight(false)

func clone() -> ListItem:
	var new_list = listItem.instantiate()
	new_list.setup(belongsTo)
	return new_list
