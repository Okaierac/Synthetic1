extends ProgressBar
@onready var ac: Timer = $"../AC"
@onready var ac_bar: ProgressBar = $"."



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GlobalVar.AC == false:
		ac_bar.hide()
	else: if GlobalVar.AC == true:
		ac_bar.show()
		ac_bar.value = ac.time_left
	if GlobalVar.Is_player_flipped == true:
		ac_bar.scale.x = -1
		ac_bar.position.x = -15
	else: if GlobalVar.Is_player_flipped == false:
		ac_bar.scale.x = 1
		ac_bar.position.x = 25

func _on_ac_timeout() -> void:
	GlobalVar.AC = false
	ac_bar.hide()
