extends ColorRect

const scene_button = preload("res://Scenes/UI/button.tscn")
var left: = []
var right: = []
var highlight: Vector2

func setup() -> void:
	left = []
	right = []
	left = OptionTree.path[OptionTree.path.size() - 2].connected_to
	right = OptionTree.current_branch.connected_to

	for button in $Main.get_children():
		button.queue_free()

	var cursor_y: float = 85
	for branch in left:
		var button_h: = _create_button($Main, 20, cursor_y, branch.text, func():
			OptionTree.jump_branch(branch)
			setup()
		)
		if branch == OptionTree.current_branch:
			highlight = Vector2(cursor_y, button_h)
		cursor_y += button_h + 10

	cursor_y = 85
	for branch in right:
		var button_h: = _create_button($Main, 270, cursor_y, branch.text, func():
			OptionTree.current_branch = branch
			shift_to_right()
		)
		cursor_y += button_h + 10

func shift_to_left() -> void:
	if OptionTree.path.size() == 1:
		return

	for button in $FarSide.get_children():
		button.queue_free()

	var cursor_y: float = 85
	for branch in right:
		var button_h: = _create_button($FarSide, 20, cursor_y, branch.text, func():
			pass
		)
		cursor_y += button_h + 10

	setup()
	$FarSide.position.x = 250
	$Main.position.x = -250
	GF.tween($Main, "position", Vector2(0, 0), 0.3, false)
	GF.tween($FarSide, "position", Vector2(500, 0), 0.3, false)

func shift_to_right() -> void:
	for button in $FarSide.get_children():
		button.queue_free()

	var cursor_y: float = 85
	for branch in left:
		var button_h: = _create_button($FarSide, 20, cursor_y, branch.text, func():
			pass
		)
		cursor_y += button_h + 10

	setup()
	$FarSide.position.x = 0
	$Main.position.x = 250
	GF.tween($Main, "position", Vector2(0, 0), 0.3, false)
	GF.tween($FarSide, "position", Vector2(-250, 0), 0.3, false)

func _create_button(side: Control, x: float, y: float, text: String, on_click: Callable) -> float:
	var button: = scene_button.instantiate()
	side.add_child(button)
	button.w = 210
	button.text = text
	button.position.x = x
	button.position.y = y

	button.signal_click.connect(on_click)

	return button.h

func _draw():
	const CHARACTER_0_COLOR: = Color("875047")
	const CHARACTER_1_COLOR: = Color("20202D")

	var color_left: Color
	var color_right: Color

	if OptionTree.current_branch.from_character_0:
		color_left = CHARACTER_0_COLOR
	else:
		color_left = CHARACTER_1_COLOR

	if OptionTree.current_branch.connected_to[0].from_character_0:
		color_right = CHARACTER_0_COLOR
	else:
		color_right = CHARACTER_1_COLOR

	if $Main.position.x == 0:
		draw_line(Vector2(240, highlight.x), Vector2(240, highlight.x + highlight.y), Color(1, 1, 1), 2)

	draw_rect(Rect2(20, 70, 8, 8), color_left)
	draw_rect(Rect2(270, 70, 8, 8), color_right)

func _process(_delta):
	queue_redraw()
