extends RayCast2D

signal enemy_detected_r

@onready var hitbox: RayCast2D = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if hitbox.is_colliding() and Input.is_action_just_pressed("attack"):
		enemy_detected_r.emit()
