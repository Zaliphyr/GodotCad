class_name MainUi
extends Control

@onready var mouse_button: Button = $HBoxContainer/Button2
@onready var tool_text: Label = $HBoxContainer/Label
@onready var list_container: VBoxContainer = $Panel/ScrollContainer/VBoxContainer
@export var main: Main


func _on_button_2_toggled(toggled_on: bool) -> void:
	if toggled_on:
		main.tool = "point"
		tool_text.text = "point"
	else:
		main.tool = ""
		tool_text.text = "NONE"
