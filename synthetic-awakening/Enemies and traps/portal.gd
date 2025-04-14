extends Area2D

var entered = false
@onready var interactable: Area2D = $Interactable


func _on_body_entered(body: CharacterBody2D) -> void:
	entered = true



func _on_body_exited(body: CharacterBody2D) -> void:
	entered = false


func _ready() -> void:
	interactable.interact = _on_interact
	
func _on_interact():
	if entered == true:
		if Input.is_action_just_pressed("interact"):
			get_tree().change_scene_to_file("res://Scenes/side_main.tscn")
	return
