extends Control

@onready var wfs: OptionButton = $MarginContainer/VBoxContainer/WFS

func _ready():
	_load_settings()
	wfs.item_selected.connect(_on_wfs_item_selected)

func _on_mute_check_box_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(0, toggled_on)

func _save_settings(index: int) -> void:
	var config = ConfigFile.new()
	config.set_value("display", "mode", index)
	config.save("user://settings.cfg")

func _load_settings():
	var config = ConfigFile.new()
	if config.load("user://settings.cfg") == OK:
		var mode = config.get_value("display", "mode", 0)
		wfs.select(mode)
		_on_wfs_item_selected(mode)

func _on_wfs_item_selected(index: int) -> void:
	match index:
		0:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		1:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	_save_settings(index)

func _on_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0, value/5)

func _on_go_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Main_Menu/main_menu.tscn")
