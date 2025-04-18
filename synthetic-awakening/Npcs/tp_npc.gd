extends CharacterBody2D


@onready var interactable: Area2D = $Interactable



func _ready() -> void:
	interactable.interact = _on_interact
	
func _on_interact():
	DialogueManager.show_example_dialogue_balloon(load("res://dialogues/quest+tp.dialogue"), "start")
	return


	
