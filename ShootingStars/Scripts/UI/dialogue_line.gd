extends Node2D

func _draw():
	var character: AnimatedSprite2D
	if OptionTree.is_character_0:
		character = GV.character_0
	else:
		character = GV.character_1

	var character_point: = _get_characters_point(character)
	var dialogue_point: = Vector2(GV.dialogue_label.position.x, GV.dialogue_label.position.y + 3)

	draw_line(character_point, Vector2(character_point.x, dialogue_point.y), Color(1, 1, 1), 0.5)
	draw_line(Vector2(character_point.x, dialogue_point.y), dialogue_point, Color(1, 1, 1), 0.5)

func _process(_delta):
	queue_redraw()

func _get_characters_point(character: AnimatedSprite2D) -> Vector2:
	return Vector2(character.position.x, character.position.y - character.sprite_frames.get_frame_texture("default", 0).get_size().y / 2 - 3)
