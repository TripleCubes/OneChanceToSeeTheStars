extends AnimatedSprite2D

func _ready():
	var timer: = get_tree().create_timer(randf_range(0, 1))
	timer.timeout.connect(play)
