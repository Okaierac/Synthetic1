extends Area2D

@export var top_down_scene: String = "res://Scenes/topdown_main.tscn" # Path to the top-down scene
@onready var sprite_2d: Sprite2D = $Sprite2D

func _on_body_entered(body):
	print("Touched by:", body.name)  # Debugging
	if body.is_in_group("player_side"):
		get_tree().change_scene_to_file(top_down_scene)
