extends CharacterBody2D
@onready var Chest_Anim: AnimatedSprite2D = $AnimatedSprite2D
var entered = false
@onready var interactable: Area2D = $Interactable
var my_array = RandomNumberGenerator.new()
var Chest_Value = 0
@onready var chest: CharacterBody2D = $"."
var teleport_to_enemy := false
var special_values = [1, 2, 3, 4, 5, 6, 7, 8, 9, 47]

#Coins
signal common
signal rare
signal legendary

func _on_body_entered(body: CharacterBody2D) -> void:
	entered = true




func _on_body_exited(body: CharacterBody2D) -> void:
	entered = false


func _ready() -> void:
	interactable.interact = _on_interact

func _on_interact():
	if Input.is_action_just_pressed("interact"):
		if Chest_Value not in special_values:
			Chest_Anim.play("Common_Open")
			common.emit()
		if Chest_Value == 47:
			Chest_Anim.play("Rare_Open")
			rare.emit()
		if Chest_Value in [1, 2, 3, 4, 5, 6, 7, 8, 9]:
			Chest_Anim.play("Legendary-Open")
			legendary.emit()
	return


func _on_penemy_knight_dead() -> void:
	print("Teleporting chest to ", GlobalVar.enemy_location)  # Debugging print
	position = GlobalVar.enemy_location  # Teleport instantly


func _on_penemy_knight_killed() -> void:
	position = GlobalVar.enemy_location


func _on_penemy_knight_damage() -> void:
	Chest_Value = randi_range(1, 100)
	if Chest_Value not in special_values:
		Chest_Anim.play("Common_Closed")
	if Chest_Value == 47:
		Chest_Anim.play("Rare_Closed")
	if Chest_Value in [1, 2, 3, 4, 5, 6, 7, 8, 9]:
		Chest_Anim.play("Legendary_Closed")
