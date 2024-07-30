class_name Asteroid extends CharacterBody2D

@export_range(10,100) var speed := 10.0

var _motion := Vector2.ZERO

func _physics_process(delta: float) -> void:
	if _motion != Vector2.ZERO:
		move_and_collide(_motion * delta * speed)

func set_motion(motion:Vector2) -> void:
	var random := randf_range(1,2)
	speed /= random
	apply_scale(Vector2.ONE * random )
	_motion = motion

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
