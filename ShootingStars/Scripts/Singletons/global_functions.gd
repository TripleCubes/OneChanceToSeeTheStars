extends Node

func wait(time: float, callable: Callable) -> void:
	var timer: = get_tree().create_timer(time)
	timer.timeout.connect(callable)

func tween(node: Node2D, property: NodePath, value: Variant, time: float, sine: bool) -> void:
	var tween_var: = get_tree().create_tween()
	if sine:
		tween_var.tween_property(node, property, value, time).set_trans(Tween.TRANS_SINE)
	else:
		tween_var.tween_property(node, property, value, time)
