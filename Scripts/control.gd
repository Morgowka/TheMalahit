extends Control

@onready var play_button = $VBoxContainer/PlayButton
@onready var settings_button = $VBoxContainer/SettingsButton
@onready var quit_button = $VBoxContainer/QuitButton

func _ready():
	play_button.pressed.connect(_on_play_pressed)
	settings_button.pressed.connect(_on_settings_pressed)
	quit_button.pressed.connect(_on_quit_pressed)
	
	play_button.grab_focus()

func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/node_2d.tscn")

func _on_settings_pressed():
	var settings_scene = load("res://scenes/settings_menu.tscn")
	var settings_instance = settings_scene.instantiate()
	add_child(settings_instance)
	
	visible = false

func _on_quit_pressed():
	# Выход из игры
	get_tree().quit()
