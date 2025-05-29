extends RayCast2D

signal enemy1_detected_l
signal enemy2_detected_l
signal enemy3_detected_l
signal enemy4_detected_l

@onready var hitbox_l: RayCast2D = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if hitbox_l.is_colliding() and Input.is_action_just_pressed("attack"):
		var collider = hitbox_l.get_collider()
		#print("Hit object: ", collider.name)  ## or collider.get_class(), collider, etc.
		if collider.name == "HitboxKnight":
			enemy1_detected_l.emit()
		elif collider.name == "HitboxKnight2":
			enemy2_detected_l.emit()
		elif collider.name == "HitboxKnight3":
			enemy3_detected_l.emit()
		else:
			enemy4_detected_l.emit()
