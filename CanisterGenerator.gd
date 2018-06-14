extends Node2D

var _generator_timer
var _generator_interval = 5

func _ready():
	_generator_timer = Timer.new()
	add_child(_generator_timer)
	_generator_timer.connect("timeout", self, "_generate_new_canister");
	_generator_timer.set_wait_time(_generator_interval);
	_generator_timer.set_one_shot(false);
	_generator_timer.start();

func _generate_new_canister():
	var canister= load("res://Canister.tscn").instance();
	get_parent().get_parent().add_child(canister);