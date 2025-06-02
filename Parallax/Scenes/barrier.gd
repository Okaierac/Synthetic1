extends Sprite2D
var ready_to_tp := false
@onready var interactable: Area2D = $Interactable
@onready var timer: Timer = $Timer


func _ready() -> void:
	interactable.interact = _on_interact

func _on_interact():
	if GlobalVar.TalkedtoWizard == 2:
		queue_free()
	else: if GlobalVar.TalkedtoWizard == 3:
		DialogueManager.show_example_dialogue_balloon(load("res://dialogues/Go TO WIzard.dialogue"), "start")
	timer.start()
	return





	


func _on_timer_timeout() -> void:
	pass
