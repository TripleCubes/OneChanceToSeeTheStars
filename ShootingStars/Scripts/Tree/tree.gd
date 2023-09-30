extends Node

var branch_list: = []
var current_branch: Branch = null:
	get: return current_branch
	set(val):
		current_branch = val
		set_button_list(current_branch)

func gb(in_text: String) -> Branch:
	var result: = GF.find_in_list(branch_list, in_text, func(list_item): return list_item.text)
	if result == -1:
		print("Cant find branch " + in_text + " in branch_list")
		return
	
	return branch_list[result]

func set_button_list(branch: Branch) -> void:
	GV.dialogue_label.text = current_branch.text

	for button in GV.button_list.get_children():
		button.hide()
	
	GV.next_button.hide()

	if branch.connected_to.size() == 1:
		GV.next_button.show()
		return

	for i in branch.connected_to.size():
		var sub_branch: Branch = branch.connected_to[i]
		var button = GV.button_list.get_child(i)
		button.text = sub_branch.text
		button.show()

func button_pressed(index: int) -> void:
	current_branch = current_branch.connected_to[index]
