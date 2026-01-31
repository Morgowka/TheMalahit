extends Control

@onready var back_button = $VBoxContainer/BackButton
@onready var volume_slider = $VBoxContainer/VolumeSlider

func _ready():
	back_button.pressed.connect(_on_back_pressed)
	volume_slider.value_changed.connect(_on_volume_changed)
	
	volume_slider.value = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master"))

func _on_back_pressed():
	queue_free()
	get_parent().visible = true

func _on_volume_changed(value: float):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)
