@tool
extends Node2D

@onready var rtl: = get_parent().get_node("RichTextLabel")

var _bkg_fill_percentage: float = 0
var _hovered: = false

func _draw():
	draw_rect(Rect2(0, 0, rtl.size.x, rtl.size.y), Color(0, 0, 0, 0.5))

	var bkg_fill_w: float = _bkg_fill_percentage * rtl.size.x
	draw_rect(Rect2(0, 0, bkg_fill_w, rtl.size.y), Color(1, 1, 1, 0.4))

	if _hovered:
		draw_rect(Rect2(0, 0, rtl.size.x, rtl.size.y), Color(1, 1, 1), false, 2)

func _process(_delta):
	if Engine.is_editor_hint():
		return

	queue_redraw()

func _on_button_mouse_entered():
	GF.tween(self, "_bkg_fill_percentage", 1, 0.3, true)
	_hovered = true

func _on_button_mouse_exited():
	GF.tween(self, "_bkg_fill_percentage", 0, 0.3, true)
	_hovered = false
