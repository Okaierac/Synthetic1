extends AnimatedSprite2D

var hp = 10

@onready var animated_sprite_2d: AnimatedSprite2D = $"."

signal Player_Died

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if hp >= 5:
		animated_sprite_2d.animation = "5"
	elif hp == 4:
		animated_sprite_2d.animation = "4"
	elif hp == 3:
		animated_sprite_2d.animation = "3"
	elif hp == 2:
		animated_sprite_2d.animation = "2"
	elif hp == 1:
		animated_sprite_2d.animation = "1"
	elif hp == 0:
		animated_sprite_2d.animation = "0"
		Player_Died.emit()



func _on_player_side_change_hp() -> void:
	hp -= 1
