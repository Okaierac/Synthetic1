extends CharacterBody2D

var speed = 40
var player_chase = false
var player = null

func _physics_process(delta):
	if player_chase == true:
		position += (player.position - position)/speed


func _on_area_2d_body_entered(body: Node2D) -> void:
	player = body
	player_chase = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	player_chase = false
	player = null
