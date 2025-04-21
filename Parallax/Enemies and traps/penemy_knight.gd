extends CharacterBody2D

var speed = 300.0
var player_detected = false
var player_chase = false
@onready var sprite_2d: Sprite2D = $Sprite2D
signal damage

func _on_penemy_fly_player_seen() -> void:
	player_detected = true

func _physics_process(delta: float) -> void:
	# Gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Chase logic
	if player_detected:
		var target_position = $"../Player_Side".position
		var direction = (target_position - position).normalized()
		velocity.x = direction.x * speed  # Update velocity based on direction to chase the player
		move_and_slide()

	# Flip sprite direction based on velocity.x
	if velocity.x > 0:
		sprite_2d.flip_h = true  # Moving right, no flip
	elif velocity.x < 0:
		sprite_2d.flip_h = false   # Moving left, flip


func _on_area_2d_body_entered(body: Node2D) -> void:
	damage.emit()
