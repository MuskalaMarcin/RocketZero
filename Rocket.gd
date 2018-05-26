extends KinematicBody2D

const SPEED = 150
const ROT = 0.5

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	var direction = Vector2()
	print(self.position.y)
	if Input.is_action_pressed("ui_down"):
		if self.position.x > -140:
			if self.rotation < 0.4:
				self.rotation += ROT * delta
			direction.y += SPEED
	if Input.is_action_pressed("ui_up"):
		if self.position.x < 140:
			if self.rotation > -0.4:
				self.rotation -= ROT * delta
			direction.y += -SPEED
	if Input.is_action_just_released("ui_down") or Input.is_action_just_released("ui_up"):
		self.rotation = 0

	set_position(self.position + direction.normalized() * SPEED * delta)