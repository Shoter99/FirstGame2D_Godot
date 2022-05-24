extends KinematicBody2D

export var speed := 200
var screen_size : Vector2


func _ready():
	hide()
	screen_size = get_viewport_rect().size

func _physics_process(delta):
	var velocity := Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	)
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed * delta * 100
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	move_and_slide(velocity)
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
	if velocity.x != 0:
		$AnimatedSprite.animation = "walk"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite.animation = "up"
		$AnimatedSprite.flip_v = velocity.y > 0


func _on_Hitbox_body_entered(body):
	hide()
	print("hit")
	emit_signal("hit")
	$Hitbox/CollisionShape2D.set_deferred("disabled", true)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
