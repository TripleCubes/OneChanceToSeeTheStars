extends ColorRect

func _ready():
	material.set_shader_parameter("color_texture", preload("res://Assets/Sprites/colors.png"))

func _process(_delta):
	material.set_shader_parameter("at_night_float", GV.at_night_float)
