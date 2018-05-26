extends Node2D

var _timer = null;
var _rock_generation_interval = 0.5; #start interval in seconds
var _previous = "top";

func _ready():
	_start_rock_generator_job();
	
func _start_rock_generator_job():
	_timer = Timer.new();
	add_child(_timer);
	_timer.connect("timeout", self, "_generate_new_rock");
	_timer.set_wait_time(_rock_generation_interval);
	_timer.set_one_shot(false);
	_timer.start();

func _generate_new_rock():
	var rock_scene = load("res://Rock.tscn");
	var rock = rock_scene.instance();
	if (randi() % 2 == 0):
		rock.init("bottom");
		#_previous = "bottom";
	else:
		rock.init("top");
		#_previous = "top";
		
	#rock.init("top");
	#rock.init("bottom");	
	add_child(rock);