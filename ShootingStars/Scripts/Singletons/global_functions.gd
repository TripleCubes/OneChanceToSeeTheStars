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
