extends Control

@export var game_over_sound:AudioStreamPlayer

func _on_button_pressed() -> void:
	get_tree().reload_current_scene()

func _on_gatito_game_over(pos:Vector2) -> void:
	SoundManager.level_song.stop()
	game_over_sound.play()
	var camera := get_viewport().get_camera_2d()	
	if camera != null:
		camera.position = pos
		var tween := get_tree().create_tween()
		var zoom := Vector2.ONE * 2
		var duration := game_over_sound.stream.get_length()
		tween.tween_property(camera,"zoom",zoom,duration)
		tween.tween_callback(show)

func _on_game_over_sound_finished() -> void:
	SoundManager.level_song.play()
