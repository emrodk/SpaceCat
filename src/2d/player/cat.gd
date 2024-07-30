class_name Cat extends Area2D

signal game_over(position:Vector2)

@export_range(10,100) var velocity := 10.0
@export var gatiClaxon: AudioStreamPlayer2D
var _is_gameplay_on:bool

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not _is_gameplay_on:
		return
	
	var direction := Vector2.ZERO
	if Input.is_action_pressed("ui_down"):
		direction += Vector2.DOWN
	elif Input.is_action_pressed("ui_up"):
		direction += Vector2.UP
	elif Input.is_action_pressed("ui_right"):
		direction += Vector2.RIGHT
	elif Input.is_action_pressed("ui_left"):
		direction += Vector2.LEFT
	
	var viewport_size := get_viewport_rect().size
	var new_position := position + (velocity * delta * direction.normalized())
	var offset := 8
	var clamp_x := new_position.x > offset and new_position.x < viewport_size.x - offset
	var clamp_y := new_position.y > offset and new_position.y < viewport_size.y - offset
	if direction != Vector2.ZERO and clamp_x and clamp_y:
		position = new_position


func _on_danger_zone_body_entered(_body: Node2D) -> void:
	if _is_gameplay_on:
		gatiClaxon.play()

func _on_gameplay_ui_draw() -> void:
	_is_gameplay_on = true

func _on_body_entered(_body: Node2D) -> void:
	if _is_gameplay_on:
		game_over.emit(position)
		_is_gameplay_on = false
