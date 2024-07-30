extends Control

var _count :int = 0
@export var label : Label
@export var timer :Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_count = 0
	label.text = str(_count)

func _on_timer_2_timeout() -> void:
	_count += 1
	label.text = str(_count)

func _on_start_menu_ui_hidden() -> void:
	visible = true

func _on_draw() -> void:
	timer.start()

func _on_gatito_game_over(_pos:Vector2) -> void:
	timer.stop()
