extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

const FUEL_ADDED = 20
const FUEL_CONSUMPTION = 0.4
var previousFuel
var currentFuel
var fuel

func addFuel():
	currentFuel += FUEL_ADDED

func _updateFuelGaugeValue():
	currentFuel = int(round(fuel))
	if (currentFuel != previousFuel):
		get_node("FuelGaugeLabel").set_text(str(currentFuel));
		previousFuel = currentFuel

func _ready():
	fuel = 100
	_updateFuelGaugeValue()
	pass
	
func _physics_process(delta):
	fuel -= delta * FUEL_CONSUMPTION
	if Input.is_action_pressed("ui_right"):
		fuel -= delta * FUEL_CONSUMPTION * 1.5
	_updateFuelGaugeValue()
	if(fuel < 0):
		print("TODO koniec paliwa")
