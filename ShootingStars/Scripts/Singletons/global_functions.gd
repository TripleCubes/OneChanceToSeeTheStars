extends Node

func find_in_list(list: Array, find, callable: Callable) -> int:
	for i in list.size():
		var list_item = list[i]
		if callable.call(list_item) == find:
			return i
	
	return -1

func wait(time: float, callable: Callable) -> void:
	var timer: = get_tree().create_timer(time)
	timer.timeout.connect(callable)

func tween(obj, property: NodePath, value: Variant, time: float, sine: bool) -> void:
	var tween_var: = get_tree().create_tween()
	if sine:
		tween_var.tween_property(obj, property, value, time).set_trans(Tween.TRANS_SINE)
	else:
		tween_var.tween_property(obj, property, value, time)

func st(time: float) -> void:
	tween(GV, "at_night_float", time, 6, true)

func reset() -> void:
	st(0)
	OptionTree.path.clear()
	OptionTree.current_branch = GV.root_dialogue
	OptionTree.previous_branch = GV.root_dialogue
	GV.tree_view.position.x = -1000
