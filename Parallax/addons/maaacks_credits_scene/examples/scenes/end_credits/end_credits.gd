@tool
extends Credits

@export_file("*.tscn") var main_menu_scene : String
@onready var init_mouse_filter = mouse_filter

func _end_reached():
	%EndMessagePanel.show()
	mouse_filter = Control.MOUSE_FILTER_STOP
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	super._end_reached()

func _ready():
	if OS.has_feature("web"):
		%MenuButton.hide()
	super._ready()

func reset():
	super.reset()
	%EndMessagePanel.hide()
	mouse_filter = init_mouse_filter

func _unhandled_input(event):
	if not enabled: return
	if event.is_action_pressed("ui_cancel"):
		if not %EndMessagePanel.visible:
			_end_reached()
		else:
			get_tree().quit()

func _on_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Main_Menu/main_menu.tscn")
