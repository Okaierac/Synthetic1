extends CharacterBody2D

const SPEED = 40
signal player_seen

func _on_area_2d_body_entered(body: Node2D) -> void:
	player_seen.emit()

func _physics_process(delta: float) -> void:
	pass
