extends RichTextLabel

var _visible_characters_float: float = 0
var _set_text_to: = ""

func set_txt(in_text: String) -> void:
	_set_text_to = in_text
	_visible_characters_float = 1

func _ready():
	visible_characters_behavior = TextServer.VC_CHARS_AFTER_SHAPING

func _process(_delta):
	text = _set_text_to
	visible_characters = int(_visible_characters_float)
	_visible_characters_float += _delta * 20
