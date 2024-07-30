extends Path2D

@export var asteroid_scene : PackedScene
@export var follow :PathFollow2D
@export var container :Node2D
@export var player :Cat

func spawn() -> void:
	var random := randf_range(0,1)
	follow.progress_ratio = random
	var asteroid :Asteroid = asteroid_scene.instantiate()
	asteroid.position = follow.position
	container.add_child(asteroid)
	var asteroid_pos := asteroid.position
	asteroid.set_motion(asteroid_pos.direction_to(player.position))

func _on_spawn_timer_timeout() -> void:
	spawn()

func _on_gameplay_ui_draw() -> void:
	for asteroid in container.get_children():
		asteroid.queue_free()
