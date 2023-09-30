@tool
extends Node2D

signal signal_click

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
		h = 0
		$Bkg.queue_redraw()

@export var w: float:
	get:
		if not has_node("Button") or not has_node("RichTextLabel"):
			return 0
		return $RichTextLabel.size.x
	set(val):
		if not has_node("Button") or not has_node("RichTextLabel"):
			return

		$RichTextLabel.size.x = val
		$Button.size.x = $RichTextLabel.size.x
		$Bkg.queue_redraw()

@export var h: float:
	get:
		if not has_node("Button") or not has_node("RichTextLabel"):
			return 0
		return $RichTextLabel.size.y
	set(val):
		if not has_node("Button") or not has_node("RichTextLabel"):
			return

		$RichTextLabel.size.y = val
		$Button.size.y = $RichTextLabel.size.y
		$Bkg.queue_redraw()

func _ready():
	$Button.focus_mode = Control.FOCUS_NONE
	$Button.theme = preload("res://Styles/style.tres")

func _on_button_pressed():
	signal_click.emit()
