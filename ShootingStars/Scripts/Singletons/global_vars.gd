extends Node

@onready var button_list: = get_node("/root/Main/Buttons")
@onready var next_button: = get_node("/root/Main/NextButton")
@onready var next_button_original_pos_x: float = next_button.position.x
@onready var dialogue_label: = get_node("/root/Main/Dialogue")
@onready var dialogue_line: = get_node("/root/Main/DialogueLine")
@onready var option_line: = get_node("/root/Main/OptionLine")
@onready var tree_view: = get_node("/root/Main/TreeView")
@onready var character_0: = get_node("/root/Main/Character0")
@onready var character_1: = get_node("/root/Main/Character1")

var at_night_float: float = 0
