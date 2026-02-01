extends Control

@onready var play_button = $VBoxContainer/PlayButton
@onready var settings_button = $VBoxContainer/SettingsButton
@onready var quit_button = $VBoxContainer/QuitButton

@export var menu_sound: AudioStream

@onready var audio_player = $AudioStreamPlayer

func _ready():
	play_button.pressed.connect(_on_play_pressed)
	settings_button.pressed.connect(_on_settings_pressed)
	quit_button.pressed.connect(_on_quit_pressed)
	
	play_button.grab_focus()
	
	play_sound(menu_sound)
	
		# Скрываем курсор
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	# Отключаем обработку ввода для всего UI
	set_process_input(false)
	set_process_unhandled_input(false)
	
func play_sound(sound: AudioStream):
	if sound and audio_player:
		audio_player.stream = sound
		audio_player.play()

func _on_play_pressed():
	await get_tree().create_timer(0.35).timeout
	get_tree().change_scene_to_file("res://scenes/node_2d.tscn")

func _on_settings_pressed():
	await get_tree().create_timer(0.35).timeout
	var settings_scene = load("res://scenes/settings_menu.tscn")
	var settings_instance = settings_scene.instantiate()
	add_child(settings_instance)
	
	visible = false

func _on_quit_pressed():
	# Выход из игры
	await get_tree().create_timer(0.35).timeout
	get_tree().quit()
