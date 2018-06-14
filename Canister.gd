extends Node2D

const PRECISION = 50
const MIN_X_MOVE = 1500
const MAX_X_MOVE = 3000
const Y_MOVE = 700

var movingObjects
var rocket

func _ready():
	movingObjects = get_parent().get_node("MovingObjects")
	rocket = movingObjects.get_node("RocketScene").get_node("Rocket")
	randomize()
	position.x = movingObjects.position.x + MIN_X_MOVE + (randi() % MAX_X_MOVE)
	randomize()
	position.y = randi() % Y_MOVE - (Y_MOVE / 2)
	pass

func _process(delta):
	var rocketPositionY = rocket.get_global_position().y - 376
	var rocketPositionX = rocket.get_global_position().x - 750
	if(_isPlusMinusTheSame(rocketPositionY, get_global_position().y) && _isPlusMinusTheSame(rocketPositionX, get_global_position().x)):
		movingObjects.get_node("FuelGauge").addFuel()
		hide()
	pass

func _isPlusMinusTheSame(val1, val2):
	return abs(val1 - val2) < PRECISION