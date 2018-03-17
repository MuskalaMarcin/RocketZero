extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _input(event):
	if event.is_action_pressed("ui_down"):
		$RocketBody.rotate(0.5)
		$RocketBody.move_local_y(10);
	if event.is_action_pressed("ui_up"):
		$RocketBody.move_local_y(-10);
		$RocketBody.rotate(-0.5)
	if event.is_action_released("ui_up"):
		$RocketBody.rotate(0.5)
	if event.is_action_released("ui_down"):
		$RocketBody.rotate(-0.5)