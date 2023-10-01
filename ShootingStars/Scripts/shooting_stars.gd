extends Node2D

var star_list: = []
var time_until_next_star: float = 0

var shooting_star_list: = []
var time_until_next_shooting_star: float = 0

var _shooting_star_started: = false

var started: = false:
	get: return started
	set(val):
		if started == val:
			return

		started = val
		GF.wait(10, func(): _shooting_star_started = val)

		if started:
			GF.tween(GV.camera, "position", Vector2(0, -500), 1, true)

			if GV.first_shooting_stars:
				GF.wait(8, func(): GF.tween(GV.restart_button, "modulate", Color(1, 1, 1, 1), 1, true))
				GF.wait(8, func(): GF.tween(GV.thanks_for_playing, "modulate", Color(1, 1, 1, 1), 1, true))
			GV.first_shooting_stars = false
		else:
			GF.reset()
			GF.wait(8, func(): GF.tween(GV.camera, "position", Vector2(0, 0), 1, true))
			GF.wait(12, func(): GV.thanks_for_playing.modulate = Color(0, 0, 0, 0))

func _draw():
	_draw_stars()
	_draw_shooting_stars()

func _draw_stars() -> void:
	for star in star_list:
		_draw_star(star.x, star.y, star.radius())

func _draw_star(x: float, y: float, radius: float) -> void:
	draw_line(Vector2(x - radius/2, y), Vector2(x + radius/2, y), Color(1, 1, 1), 1)
	draw_line(Vector2(x, y - radius/2), Vector2(x, y + radius/2), Color(1, 1, 1), 1)

func _draw_shooting_stars() -> void:
	for shooting_star in shooting_star_list:
		_draw_shooting_star(shooting_star)

func _draw_shooting_star(shooting_star: ShootingStar) -> void:
	var head_pos: = Vector2(shooting_star.x, shooting_star.y)
	var tail_pos: = head_pos - shooting_star.dir*shooting_star.length
	draw_line(head_pos + Vector2(0, shooting_star.max_radius/2), tail_pos, Color(1, 1, 1), 1)
	draw_line(head_pos, tail_pos, Color(1, 1, 1), 1)
	draw_line(head_pos - Vector2(0, shooting_star.max_radius/2), tail_pos, Color(1, 1, 1), 1)
	
func _process(_delta):
	if started:
		time_until_next_star -= _delta
		if time_until_next_star < 0:
			star_list.append(Star.new())
			time_until_next_star = randf_range(0.15, 0.3)

	if _shooting_star_started:
		time_until_next_shooting_star -= _delta
		if time_until_next_shooting_star < 0:
			shooting_star_list.append(ShootingStar.new())
			time_until_next_shooting_star = randf_range(0.8, 1.2)

	for i in range(star_list.size() - 1, -1, -1):
		var star = star_list[i]
		if star.can_be_released():
			star_list.remove_at(i)

	for shooting_star in shooting_star_list:
		shooting_star.update()

	for i in range(shooting_star_list.size() - 1, -1, -1):
		var shooting_star = shooting_star_list[i]
		if shooting_star.can_be_released():
			shooting_star_list.remove_at(i)

	queue_redraw()

class Star:
	var x: float = 0
	var y: float = 0
	var creation_time: float = 0
	var life_time_sec: float = 0
	var max_radius: float = 0

	func _init():
		x = randf_range(0, 500)
		y = randf_range(0, 500)
		life_time_sec = randf_range(10, 30)
		max_radius = randf_range(1, 4)
		creation_time = Time.get_ticks_msec()

	func can_be_released() -> bool:
		return Time.get_ticks_msec() - creation_time > life_time_sec * 1000

	func radius() -> float:
		var existed_for: = (Time.get_ticks_msec() - creation_time) / 1000
		var d: float = abs(existed_for - life_time_sec / 2)
		return (1 - (d / (life_time_sec / 2))) * max_radius

class ShootingStar:
	var x: float = 500
	var y: float = randf_range(-300, 300)
	var creation_time: = Time.get_ticks_msec()
	var max_radius: = randf_range(0.5, 4)
	var speed: = randf_range(60, 120)
	var dir: = Vector2(-1, 0.7).normalized().rotated(deg_to_rad(randf_range(-2, 2)))
	var length: float = randf_range(1000, 2000)

	func can_be_released() -> bool:
		return y > 10000

	func update() -> void:
		x += dir.x * speed
		y += dir.y * speed
