extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _setFuelGaugeValue(value):
	get_node("FuelGaugeLabel").set_text(str(value));
	print(value)
	pass

func _ready():
	var rocketScene = preload("res://RocketScene.tscn");
	rocketScene.instance().get_node("Rocket").connect("fuel_update", self, "_setFuelGaugeValue");
	pass
