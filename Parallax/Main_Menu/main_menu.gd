extends Node

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/topdown_main.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_settings_pressed() -> void:
	pass # Replace with function body.
