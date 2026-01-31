extends Area2D

# Сюда в инспекторе Godot нужно перетащить файл SpriteFrames с новой маской
@export var new_player_sprite_frames: SpriteFrames

# Функция, которая вызывается при взаимодействии
# ВАЖНО: убедитесь, что ваш игрок передает себя (self) в эту функцию
func interact(player):
 if player == null:
  return

 # Ищем узел AnimatedSprite2D именно ВНУТРИ игрока
 var player_sprite = player.get_node_or_null("AnimatedSprite2D")
 
 if player_sprite != null:
  # Меняем набор анимаций игрока на новый (в маске)
  player_sprite.sprite_frames = new_player_sprite_frames
  
  # Запускаем анимацию, чтобы спрайт обновился мгновенно
  if player_sprite.sprite_frames.has_animation("idle_mask"):
   player_sprite.play("idle_mask")
  
  print("Маска надета!")
  
  # Если вы хотите, чтобы маска исчезла после того, как её надели:
  # queue_free() 
 else:
  print("Ошибка: У игрока не найден узел AnimatedSprite2D")

# Если вы используете сигналы Area2D (например, наступаете на маску)
func _on_body_entered(body):
 # Проверяем, что вошедшее тело — это игрок (например, по имени или группе)
 if body.name == "Player" or body.is_in_group("player"):
  interact(body)
