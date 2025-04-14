class_name player_side extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -900.0
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D


func _physics_process(delta: float) -> void:
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
