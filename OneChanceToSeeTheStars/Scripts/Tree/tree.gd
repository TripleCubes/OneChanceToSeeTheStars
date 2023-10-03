extends Node

var path: = []
var branch_list: = []
var previous_branch: Branch = null
var _current_branch: Branch = null
var current_branch: Branch:
	get: return _current_branch
	set(val):
		previous_branch = _current_branch
		_current_branch = val
		path.append(_current_branch)
		set_button_list(_current_branch)

		if not _current_branch.callable.is_null():
			_current_branch.callable.call()

var is_character_0: bool:
	get: return current_branch.from_character_0

func go_up_branch() -> void:
	previous_branch = _current_branch
	if path.size() < 2:
		return
	_current_branch = path[path.size() - 2]
	path.pop_back()
	set_button_list(_current_branch)

	if not _current_branch.callable.is_null():
		_current_branch.callable.call()

func jump_branch(branch: Branch) -> void:
	path.pop_back()
	current_branch = branch

# Get branch by text, search from all branches
func gb(in_text: String) -> Branch:
	var result: = GF.find_in_list(branch_list, in_text, func(list_item): return list_item.text)
	if result == -1:
		print("Cant find branch " + in_text + " in branch_list")
		return
	
	return branch_list[result]

func set_button_list(branch: Branch) -> void:
	const PADDING_TOP: float = 10
	const SPACING: float = 10

	if is_character_0:
		GV.dialogue_line.new_line(GV.character_0)
	else:
		GV.dialogue_line.new_line(GV.character_1)

	GV.dialogue_label.text = current_branch.text
	GV.dialogue_label.size.y = 0

	var cursor_y: float = GV.dialogue_label.position.y + GV.dialogue_label.size.y + PADDING_TOP
	
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
