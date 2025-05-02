extends StaticBody2D
@onready var Chest_Anim: AnimatedSprite2D = $AnimatedSprite2D
var entered = false
@onready var interactable: Area2D = $Interactable
var my_array = [1,2,3]
var Chest_Value = my_array.pick_random()



func _on_body_entered(body: CharacterBody2D) -> void:
	entered = true
	


func _on_body_exited(body: CharacterBody2D) -> void:
	entered = false


func _ready() -> void:
	interactable.interact = _on_interact
	if Chest_Value == 1:
		Chest_Anim.animation = "Common_Closed"
	if Chest_Value == 2:
		Chest_Anim.animation = "Rare_Closed"
	if Chest_Value == 3:
		Chest_Anim.animation = "Legendary_Closed"
	
func _on_interact():
	if Input.is_action_just_pressed("interact"):
		if Chest_Value == 1:
			Chest_Anim.animation = "Common_Open"
		if Chest_Value == 2:
			Chest_Anim.animation = "Rare_Open"
		if Chest_Value == 3:
			Chest_Anim.animation = "Legendary-Open"
	return
