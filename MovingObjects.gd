extends Node2D

const SPEED = 200

func moveRight(directionX, speed, delta):
	set_position(self.position + directionX.normalized() * speed * delta)

func _ready():
	pass

var direction = Vector2(10,0)

func _process(delta):
	var directionX = Vector2()
	directionX.x += SPEED
	if Input.is_action_pressed("ui_right"):
		directionX.x += SPEED * 2
	set_position(self.position + directionX.normalized() * SPEED * delta)