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
		position.y += 50
	if event.is_action_pressed("ui_up"):
		position.y -= 50