extends Node2D

const SPEED_CONST = 200

func _ready():
	pass

func _process(delta):
	var speed = SPEED_CONST;
	if Input.is_action_pressed("ui_right"):
		speed *= 2
	var directionX = Vector2()
	directionX.x += speed
	set_position(self.position + directionX.normalized() * speed * delta)
