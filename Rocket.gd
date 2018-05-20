extends KinematicBody2D

const SPEED = 150

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	var direction = Vector2()
	if Input.is_action_pressed("ui_down"):
		direction.y += SPEED
	if Input.is_action_pressed("ui_up"):
		direction.y += -SPEED
	if Input.is_action_pressed("ui_left"):
		direction.x += -SPEED
	if Input.is_action_pressed("ui_right"):
		direction.x += SPEED

	set_position(self.position + direction.normalized() * SPEED * delta)