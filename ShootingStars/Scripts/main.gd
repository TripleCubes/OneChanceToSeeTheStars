extends Node2D

func _on_button_signal_click():
	OptionTree.button_pressed(0)

func _on_button_2_signal_click():
	OptionTree.button_pressed(1)

func _on_button_3_signal_click():
	OptionTree.button_pressed(2)

func _on_button_4_signal_click():
	OptionTree.button_pressed(3)

func _on_button_5_signal_click():
	OptionTree.button_pressed(4)

func _on_next_button_signal_click():
	OptionTree.button_pressed(0)

func _on_tree_button_signal_click():
	GV.tree_view.position.x = 0
	GV.tree_view.setup()

func _on_back_button_signal_click():
	GV.tree_view.position.x = -1000

func _on_up_button_signal_click():
	if GV.tree_view.get_node("Main").position.x != 0:
		return

	OptionTree.go_up_branch()
	GV.tree_view.setup()
	GV.tree_view.shift_to_left()

func _on_restart_button_signal_click():
	GV.shooting_stars.started = false
