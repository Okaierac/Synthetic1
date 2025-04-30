extends Node

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	animated_sprite_2d.animation = "default"


func _on_play_again_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/topdown_main.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()
