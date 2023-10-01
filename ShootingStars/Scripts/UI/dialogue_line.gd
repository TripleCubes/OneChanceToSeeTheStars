extends Node2D

var _line_list: = []

func new_line(character: AnimatedSprite2D) -> void:
	for line in _line_list:
		line.release()

	_line_list.append(Line.new(self, character))

func _draw():
	for line in _line_list:
		line.draw()

func _process(_delta):
	for i in range(_line_list.size() -1, -1, -1):
		var line = _line_list[i]
		if line.released():
			_line_list.remove_at(i)

	queue_redraw()

class Line:
	var _start_point: float = 0
	var _end_point: float = 0
	var _character: AnimatedSprite2D
	var _dialogue_line_node: Node2D

	func _init(dialogue_line_node: Node2D, character: AnimatedSprite2D):
		_character = character
		_dialogue_line_node = dialogue_line_node

		GF.wait(0.2, func():
			GF.tween(self, "_end_point", 1000, 3.5, false)
		)

	func release() -> void:
		GF.tween(self, "_start_point", 1000, 3.5, false)

	func released() -> bool:
		return _start_point >= 800

	func draw():
		if _character == GV.character_0:
			_draw_line_0(Color(1, 1, 1), _end_point)
			_draw_line_0(Color("BEFFBA"), _start_point)
		else:
			_draw_line_1(Color(1, 1, 1), _end_point)
			_draw_line_1(Color("BEFFBA"), _start_point)

	func _draw_line_0(color: Color, draw_length: float) -> void:
		var character_point: = _get_characters_point(_character)
		var dialogue_point: = Vector2(GV.dialogue_label.position.x - 10, GV.dialogue_label.position.y + 13)
		
		var length_v_max = character_point.y - dialogue_point.y
		var length_h_max = dialogue_point.x - character_point.x
		var length_v = clamp(draw_length, 0, length_v_max)
		var length_h = clamp(draw_length - length_v, 0, length_h_max)
	
		_dialogue_line_node.draw_line(character_point, Vector2(character_point.x, character_point.y - length_v), color, 2)
		_dialogue_line_node.draw_line(Vector2(character_point.x, dialogue_point.y + 1), Vector2(character_point.x + length_h, dialogue_point.y + 1), color, 2)

	func _draw_line_1(color: Color, draw_length: float) -> void:
		var character_point: = _get_characters_point(_character)
		var dialogue_point: = Vector2(GV.dialogue_label.position.x + 12, GV.dialogue_label.position.y - 12)
		var curve_h: float = 30
		
		var length_0_max = character_point.y - dialogue_point.y + curve_h
		var length_1_max = dialogue_point.x - character_point.x
		var length_2_max = curve_h
		var length_0 = clamp(draw_length, 0, length_0_max)
		var length_1 = clamp(draw_length - length_0_max, 0, length_1_max)
		var length_2 = clamp(draw_length - length_0_max - length_1_max, 0, length_2_max)

		_dialogue_line_node.draw_line(character_point, Vector2(character_point.x, character_point.y - length_0), color, 2)
		_dialogue_line_node.draw_line(Vector2(character_point.x, dialogue_point.y - curve_h + 1), Vector2(character_point.x + length_1, dialogue_point.y - curve_h + 1), color, 2)
		_dialogue_line_node.draw_line(Vector2(dialogue_point.x, dialogue_point.y - curve_h), Vector2(dialogue_point.x, dialogue_point.y - curve_h + length_2), color, 2)

	func _get_characters_point(character: AnimatedSprite2D) -> Vector2:
		return Vector2(character.position.x, character.position.y - character.sprite_frames.get_frame_texture("default", 0).get_size().y / 2 * 3 - 30)
