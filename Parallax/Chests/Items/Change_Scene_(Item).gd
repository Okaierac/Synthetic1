extends StaticBody2D

@export var top_down_scene: String = "res://Scenes/topdown_main.tscn" # Path to the top-down scene
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var interactable: Area2D = $Interactable

#func _on_body_entered(body):
	#print("Touched by:", body.name)  # Debugging
	#if body.is_in_group("player_side"):
		#get_tree().change_scene_to_file(top_down_scene)

func _ready() -> void:
	interactable.interact = _on_interact

func _on_interact():
	DialogueManager.show_example_dialogue_balloon(load("res://dialogues/tp.dialogue"), "start")
	var ready_to_tp = true
	if ready_to_tp == true:
		get_tree().change_scene_to_file(top_down_scene)
	return
