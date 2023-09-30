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
