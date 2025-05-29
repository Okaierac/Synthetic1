extends CharacterBody2D

@onready var penemy_knight_4: CharacterBody2D = $"."
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer: Timer = $Timer
@onready var spawn_timer: Timer = $spawn_timer

var hp = 5
var speed = 300.0
var player_detected = false
var player_chase = false
var on_action = false
var spawn = false

signal damage4
signal killed4

func _ready():
	animated_sprite_2d.animation = "alive"
	spawn_timer.start()

func _on_penemy_fly_player_seen() -> void:
	if spawn:
		if not on_action:
			position = Vector2(3170, 318500)
			on_action = true
		player_detected = true

func _physics_process(delta: float) -> void:
	
	#health system
	if hp == 0:
		player_detected = false
		animated_sprite_2d.animation = "dead"
		killed4.emit()
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


func _on_player_side_attack_4() -> void:
	hp -= 1
	animated_sprite_2d.animation = "hurt"
	timer.start()


func _on_hitbox_knight_4_body_entered(body: Node2D) -> void:
	damage4.emit()


func _on_killed_4() -> void:
	queue_free()


func _on_spawn_timer_timeout() -> void:
	spawn = true
