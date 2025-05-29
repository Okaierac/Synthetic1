extends Label
@onready var label: Label = $"."
var needed_killed = 4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GlobalVar.QuestID == "Kill 4 enemies":
		label.text = str(GlobalVar.Enemies_Killed) + " / " + str(needed_killed)
