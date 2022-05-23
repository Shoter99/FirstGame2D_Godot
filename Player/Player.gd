extends KinematicBody2D

export var speed = 200
var screen_size


func _ready():
	screen_size = get_viewport_rect().size

func _physics_process(delta):
	var velocity = Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	)
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
