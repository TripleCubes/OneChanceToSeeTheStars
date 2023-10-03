extends Node2D

var _line_list: = []

func new_line(pos_list: Array) -> void:
	for line in _line_list:
		line.release()

	if pos_list.size() != 0:
		_line_list.append(Line.new(self, pos_list))

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
	var _button_pos_list_y: = []
	var _start_point: float = 0
	var _end_point: float = 0
	var _option_line_node: Node2D

	func _init(option_line_node: Node2D, pos_list: Array):
		_option_line_node = option_line_node
		_button_pos_list_y = pos_list

		GF.wait(0.2, func():
			GF.tween(self, "_end_point", 1000, 5, false)
		)
	
	func release() -> void:
		GF.tween(self, "_start_point", 1000, 5, false)

	func released() -> bool:
		return _start_point >= 800

	func draw():
		_draw_line(Color(1, 1, 1), _end_point)
		_draw_line(Color("BEFFBA"), _start_point)

	func _draw_line(color: Color, draw_length: float) -> void:
		var point_0: = Vector2(GV.dialogue_label.position.x + 13, 
								GV.dialogue_label.position.y + GV.dialogue_label.size.y + 7)
		var point_1: = Vector2(point_0.x, _button_pos_list_y[_button_pos_list_y.size() - 1] + 13)
		var h: float = min(point_1.y - point_0.y + 1, draw_length)

		_option_line_node.draw_line(point_0, point_0 + Vector2(0, h), color, 2)

		for pos_y in _button_pos_list_y:
			var length: float = clamp(h - (pos_y - point_0.y), 0, 20)
			_option_line_node.draw_line(Vector2(point_0.x, pos_y + 13), Vector2(point_0.x + length, pos_y + 13), color, 2)
