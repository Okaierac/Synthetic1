extends TextureProgressBar
@onready var cooldown_bar: TextureProgressBar = $"."
@onready var dash_cooldown: Timer = $"../Dash_cooldown"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GlobalVar.dash_CD == false:
		cooldown_bar.hide()
	else: if GlobalVar.dash_CD == true:
		cooldown_bar.show()
		cooldown_bar.value = dash_cooldown.time_left

func _on_dash_cooldown_timeout() -> void:
	GlobalVar.dash_CD = false
	cooldown_bar.hide()
