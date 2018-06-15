extends KinematicBody2D

const SPEED = 200
const ROT = 0.4
const MAX_ROT = 0.35
const MAX_Y = 180

var movingObjects

func _ready():
	set_physics_process(true)
	get_child(4).connect("body_entered", self, "_collision");
	
func showBigFlame():
	get_child(1).show()
	get_child(2).hide()
	
func hideBigFlame():
	get_child(1).hide()
	get_child(2).show()

func _physics_process(delta):
	var directionY = Vector2()
	var flameBig = get_child(1)
	var flameSmall = get_child(2)
	var screensize = get_viewport_rect().size
	
	if Input.is_action_pressed("ui_down"):
		if self.position.y < MAX_Y:
			showBigFlame()
			if self.rotation < MAX_ROT:
				self.rotation += ROT * delta
			directionY.y += SPEED
		else:
			hideBigFlame()
			self.rotation = 0
	if Input.is_action_pressed("ui_up"):
		if self.position.y > -MAX_Y:
			showBigFlame()
			if self.rotation > -MAX_ROT:
				self.rotation -= ROT * delta
			directionY.y += -SPEED
		else:
			hideBigFlame()
			self.rotation = 0
	if Input.is_action_just_released("ui_down") or Input.is_action_just_released("ui_up"):
		hideBigFlame()
		self.rotation = 0
	if Input.is_action_just_released("ui_right"):
		hideBigFlame()
	if Input.is_action_pressed("ui_right"):
		showBigFlame()

	set_position(self.position + directionY.normalized() * SPEED * delta)
	
func _collision(collidedObject):
	if (collidedObject.is_class("RigidBody2D")):
		get_tree().change_scene("res://GameOver.tscn")