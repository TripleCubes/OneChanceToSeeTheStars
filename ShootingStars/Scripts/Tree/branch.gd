class_name Branch
extends Node

var text: String = ""
var from_character_0: bool
var connected_from: Branch = null
var connected_to: = []

func _init(in_text: String, in_from_character_0: bool):
	var find: = OptionTree.branch_list.find(in_text)
	if find != -1:
		print(in_text + " Already added")
		return

	text = in_text
	from_character_0 = in_from_character_0
	OptionTree.branch_list.append(self)

func ab0(in_text: String) -> Branch:
	var branch = Branch.new(in_text, true)
	connected_to.append(branch)
	return branch

func asf0(in_text: String) -> Branch:
	var branch = Branch.new(in_text, true)
	connected_to.append(branch)
	return self

func ab1(in_text: String) -> Branch:
	var branch = Branch.new(in_text, false)
	connected_to.append(branch)
	return branch

func asf1(in_text: String) -> Branch:
	var branch = Branch.new(in_text, false)
	connected_to.append(branch)
	return self

func a(in_text: String) -> void:
	connected_to.append(OptionTree.gb(in_text))

func gb(in_text: String) -> Branch:
	var result: = GF.find_in_list(connected_to, in_text, func(list_item): return list_item.text)
	if result == -1:
		print("Cant find branch " + in_text + " in " + text)
		return
	
	return connected_to[result]
