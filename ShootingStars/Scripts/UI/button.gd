@tool
extends Node2D

@export_multiline var text: String:
	get:
		if not has_node("Button") or not has_node("RichTextLabel"):
			return ""
		return $RichTextLabel.text
	set(val):
		if not has_node("Button") or not has_node("RichTextLabel"):
			return

		$RichTextLabel.text = val
		$Button.size = $RichTextLabel.size
		$Bkg.queue_redraw()

@export var w: float:
	get:
		if not has_node("Button") or not has_node("RichTextLabel"):
			return 0
		return $RichTextLabel.size.x
	set(val):
		if not has_node("Button") or not has_node("RichTextLabel"):
			return

		$Button.size.x = val
		$RichTextLabel.size.x = val
		$Bkg.queue_redraw()

@export var h: float:
	get:
		if not has_node("Button") or not has_node("RichTextLabel"):
			return 0
		return $RichTextLabel.size.y
	set(val):
		if not has_node("Button") or not has_node("RichTextLabel"):
			return

		$Button.size.y = val
		$RichTextLabel.size.y = val
		$Bkg.queue_redraw()

func _ready():
	$Button.focus_mode = Control.FOCUS_NONE
	$Button.theme = preload("res://Styles/style.tres")

