extends Button

@export var hover_texture: Texture2D
@export var normal_texture: Texture2D
@export var click_sound: AudioStream
@export var hover_sound: AudioStream

@onready var audio_player = $AudioStreamPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	# Автоматически подключаем сигналы
	#mouse_entered.connect(_on_mouse_entered)
	#mouse_exited.connect(_on_mouse_exited)
	pressed.connect(_on_pressed)
	
	# Для управления с клавиатуры/геймпада
	focus_entered.connect(_on_focus_entered)
	focus_exited.connect(_on_focus_exited)

func _on_mouse_entered():
	icon = hover_texture  # Меняем текстуру при наведении
	play_sound(hover_sound)

func _on_mouse_exited():
	icon = normal_texture  # Возвращаем обычную текстуру

func _on_focus_entered():
	# Эмулируем наведение при фокусе с клавиатуры
	_on_mouse_entered()

func _on_focus_exited():
	_on_mouse_exited()

func _on_pressed():
	play_sound(click_sound)
	# Дополнительные эффекты при нажатии
	animate_press()

func play_sound(sound: AudioStream):
	if sound and audio_player:
		audio_player.stream = sound
		audio_player.play()

func animate_press():
	# Анимация нажатия
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1, 0.8), 0.1)
	tween.tween_property(self, "scale", Vector2(1, 1), 0.08)
