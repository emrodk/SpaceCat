extends Control

@export var start_sound:AudioStreamPlayer

func _on_start_button_pressed() -> void:
	start_sound.play()
	visible = false
