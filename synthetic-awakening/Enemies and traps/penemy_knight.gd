extends CharacterBody2D

var speed = 40
var player_detected = false
var player_chase = false

func _on_penemy_fly_player_seen() -> void:
	player_detected = true

func _physics_process(delta: float) -> void:
	if player_detected:
		position += ($"../Player_Side".position - position)/speed
	if not is_on_floor():
		velocity += get_gravity() * delta
