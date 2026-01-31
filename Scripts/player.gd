extends CharacterBody2D

var max_speed := 100.0
var last_dir := Vector2.DOWN

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	var movement = movement_vector()

	if movement != Vector2.ZERO:
		last_dir = movement
		velocity = movement.normalized() * max_speed
		play_run_animation(movement)
	else:
		velocity = Vector2.ZERO
		play_idle_animation()

	move_and_slide()

func movement_vector() -> Vector2:
	var x = Input.get_action_strength("right") - Input.get_action_strength("left")
	var y = Input.get_action_strength("down") - Input.get_action_strength("up")
	return Vector2(x, y)

func play_run_animation(movement: Vector2) -> void:
	if abs(movement.x) > abs(movement.y):
		if movement.x > 0:
			sprite.play("run_right")
		else:
			sprite.play("run_left")
	else:
		if movement.y > 0:
			sprite.play("run")
		else:
			sprite.play("run_up")

func play_idle_animation() -> void:
	if abs(last_dir.x) > abs(last_dir.y):
		if last_dir.x > 0:
			sprite.play("idle_right")
		else:
			sprite.play("idle_left")
	else:
		if last_dir.y > 0:
			sprite.play("idle")
		else:
			sprite.play("idle_up")
