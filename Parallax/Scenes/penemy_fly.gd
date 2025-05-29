extends CharacterBody2D

@onready var sprite_2d: Sprite2D = $Sprite2D

@export var speed = 200
var direction := 1  # Start moving right
var isRight = true

signal player_seen

func _on_area_2d_body_entered(body: Node2D) -> void:
	player_seen.emit()

func _physics_process(delta: float) -> void:
	velocity.x = speed * direction
	# Move the character
	move_and_slide()
	# Flip direction if hitting a wall
	if is_on_wall():
		direction *= -1
	sprite_2d.flip_h = direction > 0
	position.y = 318416
	#if position.y == 318568:
