extends CharacterBody2D

@onready var interactable: Area2D = $Interactable
@onready var timer: Timer = $Timer
var interacted = false

func _ready() -> void:
	interactable.interact = _on_interact

func _on_interact():
	if not interacted:
		DialogueManager.show_example_dialogue_balloon(load("res://dialogues/quest+tp.dialogue"), "start")
	interacted = true
	GlobalVar.TalkedtoWizard = 2
	timer.start()
	return

func _on_timer_timeout() -> void:
	interacted = false
