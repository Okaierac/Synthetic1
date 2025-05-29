class_name player_side extends CharacterBody2D

var hp = 5
var dashing = false
var NO_cooldown = true
var cooldown = true
var damage_cool = false

signal dash_again
signal change_hp
signal attack
signal attack2
signal attack3
signal attack4

const Dash_speed = 20000
const SPEED = 400.0
const JUMP_VELOCITY = -900.0

@onready var sprite_2d: AnimatedSprite2D = $Sprite2D
@onready var ac: Timer = $AC
@onready var damage: Timer = $Damage


func _physics_process(delta: float) -> void:
	#Dash
	if Input.is_action_just_pressed("Dash"):
			dashing = true
			$Dash_timer.start()
	
	#animations
	if abs(velocity.x) > 1:
		sprite_2d.animation = "running"
	else:
		sprite_2d.animation = "default"
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		sprite_2d.animation = "jumping"

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		if dashing and NO_cooldown:
			velocity.x = direction * Dash_speed
			dashing = false
			$Dash_cooldown.start()
			NO_cooldown = false
		else:
			velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 20)
	

	move_and_slide()
	

var isFlipped = false  # Keep track of the flip state
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("left") and not isFlipped:
		sprite_2d.flip_h = true  # Flip the sprite when left arrow is pressed
		isFlipped = true  # Set the flip state to true

	if Input.is_action_just_pressed("right") and isFlipped:
		sprite_2d.flip_h = false  # Unflip the sprite when right arrow is pressed
		isFlipped = false  # Set the flip state to false



func _on_penemy_knight_damage() -> void:
	if damage_cool == false:
		hp -= 1
		change_hp.emit()
		damage_cool = true
	damage.start()


func _on_animated_sprite_2d_player_died() -> void:
	get_tree().change_scene_to_file("res://Scenes/Game_Over.tscn")


func _on_dash_timer_timeout() -> void:
	dashing = false

func _on_dash_again() -> void:
	NO_cooldown = true


func _on_dash_cooldown_timeout() -> void:
	dash_again.emit()

func _on_ac_timeout() -> void:
	cooldown = true


func _on_damage_timeout() -> void:
	damage_cool = false


func _on_penemy_knight_2_damage_2() -> void:
	if damage_cool == false:
		hp -= 1
		change_hp.emit()
		damage_cool = true
	damage.start()


func _on_hitbox_l_enemy_1_detected_l() -> void:
	ac.start()
	if isFlipped:
		if Input.is_action_just_pressed("attack") and cooldown:
			attack.emit()
			cooldown = false


func _on_hitbox_l_enemy_2_detected_l() -> void:
	ac.start()
	if isFlipped:
		if Input.is_action_just_pressed("attack") and cooldown:
			attack2.emit()
			cooldown = false


func _on_hitbox_r_enemy_1_detected_r() -> void:
	ac.start()
	if isFlipped == false:
		if Input.is_action_just_pressed("attack") and cooldown:
			attack.emit()
			cooldown = false


func _on_hitbox_r_enemy_2_detected_r() -> void:
	ac.start()
	if isFlipped == false:
		if Input.is_action_just_pressed("attack") and cooldown:
			attack2.emit()
			cooldown = false


func _on_penemy_knight_3_damage_3() -> void:
	if damage_cool == false:
		hp -= 1
		change_hp.emit()
		damage_cool = true
	damage.start()


func _on_penemy_knight_4_damage_4() -> void:
	if damage_cool == false:
		hp -= 1
		change_hp.emit()
		damage_cool = true
	damage.start()


func _on_hitbox_r_enemy_3_detected_r() -> void:
	ac.start()
	if isFlipped == false:
		if Input.is_action_just_pressed("attack") and cooldown:
			attack3.emit()
			cooldown = false


func _on_hitbox_r_enemy_4_detected_r() -> void:
	ac.start()
	if isFlipped == false:
		if Input.is_action_just_pressed("attack") and cooldown:
			attack4.emit()
			cooldown = false


func _on_hitbox_l_enemy_3_detected_l() -> void:
	ac.start()
	if isFlipped:
		if Input.is_action_just_pressed("attack") and cooldown:
			attack3.emit()
			cooldown = false


func _on_hitbox_l_enemy_4_detected_l() -> void:
	ac.start()
	if isFlipped:
		if Input.is_action_just_pressed("attack") and cooldown:
			attack4.emit()
			cooldown = false
