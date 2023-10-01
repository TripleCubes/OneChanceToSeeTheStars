extends Node

var branch_list: = []
var current_branch: Branch = null:
	get: return current_branch
	set(val):
		current_branch = val
		set_button_list(current_branch)

var is_character_0: bool:
	get: return current_branch.from_character_0

# Get branch by text, search from all branches
func gb(in_text: String) -> Branch:
	var result: = GF.find_in_list(branch_list, in_text, func(list_item): return list_item.text)
	if result == -1:
		print("Cant find branch " + in_text + " in branch_list")
		return
	
	return branch_list[result]

func set_button_list(branch: Branch) -> void:
	const PADDING_TOP: float = 30
	const SPACING: float = 10
	var cursor_y: float = GV.dialogue_label.position.y + GV.dialogue_label.size.y + PADDING_TOP

	var wait_time: float = 0
	if is_character_0:
		wait_time = GV.dialogue_line.line_0_time()
		GV.dialogue_line.new_line(GV.character_0)
	else:
		wait_time = GV.dialogue_line.line_1_time()
		GV.dialogue_line.new_line(GV.character_1)

	GF.wait(wait_time + 0.1, func():
		GV.dialogue_label.set_txt(current_branch.text)
		GV.dialogue_label.size.y = 0
	)
	
	for button in GV.button_list.get_children():
		button.hide()
	
	if branch.connected_to.size() == 1:
		GV.next_button.position.x = GV.next_button_original_pos_x
		return

	GV.next_button.position.x = -1000

	var button_pos_list_y: = []
	for i in branch.connected_to.size():
		var sub_branch: Branch = branch.connected_to[i]
		var button = GV.button_list.get_child(i)
		button.text = sub_branch.text
		button.show()

		button.position.x = GV.dialogue_label.position.x + 10
		button.position.y = cursor_y
		button_pos_list_y.append(cursor_y)
		cursor_y += button.h + SPACING

func button_pressed(index: int) -> void:
	current_branch = current_branch.connected_to[index]
