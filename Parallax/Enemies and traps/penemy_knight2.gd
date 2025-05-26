extends CharacterBody2D

@onready var penemy_knight: CharacterBody2D = $"."
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer: Timer = $Timer

var hp = 5
var speed = 300.0
var player_detected = false
var player_chase = false
var on_action = false

signal damage2
signal killed2

func _ready():
	animated_sprite_2d.animation = "alive"

func _on_penemy_fly_player_seen() -> void:
	if not on_action:
		position = Vector2(2000, 318500)
		on_action = true
	player_detected = true

func _physics_process(delta: float) -> void:
	
	#health system
	if hp == 0:
		player_detected = false
		animated_sprite_2d.animation = "dead"
		killed2.emit()
	elif hp < 0:
		#hp = 5
		#player_detected = true
		animated_sprite_2d.animation = "alive"
	
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
		animated_sprite_2d.flip_h = true  # Moving right, no flip
	elif velocity.x < 0:
		animated_sprite_2d.flip_h = false   # Moving left, flip


func _on_timer_timeout() -> void:
	if hp > 0:
		animated_sprite_2d.animation = "alive"


func _on_player_side_attack_2() -> void:
	hp -= 1
	animated_sprite_2d.animation = "hurt"
	timer.start()


func _on_killed_2() -> void:
	queue_free()


func _on_player_side_attack() -> void:
	pass # Replace with function body.


func _on_hitbox_knight_2_body_entered(body: Node2D) -> void:
	damage2.emit()
