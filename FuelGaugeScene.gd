extends Node2D

const FUEL_ADDED = 40
const FUEL_CONSUMPTION = 2
var previousFuel
var currentFuel
var fuel

func addFuel():
	fuel += FUEL_ADDED
	if (fuel > 100):
		fuel = 100

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
	if Input.is_action_pressed("ui_right") || Input.is_action_pressed("ui_up") || Input.is_action_pressed("ui_down"):
		fuel -= delta * FUEL_CONSUMPTION * 1.5
	_updateFuelGaugeValue()
	if(fuel < 0):
		print("TODO koniec paliwa koniec gry")
