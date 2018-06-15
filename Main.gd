extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	randomize()
	
func new_game():
	$MovingObjects/RocketScene/Rocket.start()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
func _on_Rocket_hit():
	print("Game over")


func _on_Home_start_game():

	$MovingObjects/RocketScene/Rocket.start()
	pass # replace with function body
