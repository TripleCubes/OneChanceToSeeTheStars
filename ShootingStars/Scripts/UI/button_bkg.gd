@tool
extends Node2D

@onready var rtl: = get_parent().get_node("RichTextLabel")

var _hovered: = false

func _draw():
	draw_rect(Rect2(0, 0, rtl.size.x, rtl.size.y), Color(0, 0, 0, 0.5))

	if _hovered:
		draw_rect(Rect2(0, 0, rtl.size.x, rtl.size.y), Color(1, 1, 1), false, 2)

func _process(_delta):
	if Engine.is_editor_hint():
		return

	queue_redraw()

func _on_button_mouse_entered():
	_hovered = true

func _on_button_mouse_exited():
	_hovered = false
