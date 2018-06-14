extends Node2D

var _rock_timer = null;
var _rock_generation_interval = 1.7; #start interval in seconds
var _huge_rock_timer = null;
var _huge_rock_generation_interval = 5;

var _level_increase_interval_1 = 9;
var _level_increase_interval_2 = 10;

var global_timer = null;

func _ready():
	_start_rock_generator_job();
	_start_huge_rock_generator_job();
	global_timer = get_parent().get_child(1);
	
func _start_rock_generator_job():
	_rock_timer = Timer.new();
	add_child(_rock_timer);
	_rock_timer.connect("timeout", self, "_generate_new_rock");
	_rock_timer.set_wait_time(_rock_generation_interval);
	_rock_timer.set_one_shot(false);
	_rock_timer.start();

func _generate_new_rock():
	_increase_level_if_required();
	var rock_scene = load("res://Rock.tscn");
	var rock = rock_scene.instance();
	if (randi() % 2 == 0):
		rock.init("bottom");
	else:
		rock.init("top");
	add_child(rock);
	
func _start_huge_rock_generator_job():
	_huge_rock_timer = Timer.new();
	add_child(_huge_rock_timer);
	_huge_rock_timer.connect("timeout", self, "_generate_new_huge_rock");
	_huge_rock_timer.set_wait_time(_huge_rock_generation_interval);
	_huge_rock_timer.set_one_shot(false);
	_huge_rock_timer.start();
	
func _generate_new_huge_rock():
	var huge_rock_scene = load("res://HugeRock.tscn");
	var huge_rock = huge_rock_scene.instance();
	huge_rock.init();
	add_child(huge_rock);
	
func _increase_level_if_required():
	if (global_timer.getCurrentTime() % _level_increase_interval_1 == 0 or global_timer.getCurrentTime() % _level_increase_interval_2 == 0):
		print("level increased");
		if (_rock_generation_interval > 0.0 && _rock_generation_interval < 0.6):
			_rock_generation_interval -= 0.05;
			_rock_timer.set_wait_time(_rock_generation_interval);
		elif (_rock_generation_interval >= 0.5 && _rock_generation_interval < 1.1):
			_level_increase_interval_1 += 5;
			_level_increase_interval_2 += 5;
			_rock_generation_interval -= 0.1;
			_rock_timer.set_wait_time(_rock_generation_interval);
		elif (_rock_generation_interval >= 1):
			_level_increase_interval_1 += 2;
			_level_increase_interval_2 += 2;
			_rock_generation_interval -= 0.2;
			_rock_timer.set_wait_time(_rock_generation_interval);
			
		if (_huge_rock_generation_interval > 0.0):
			_huge_rock_generation_interval -= 0.2;
			_huge_rock_timer.set_wait_time(_huge_rock_generation_interval);	
	
	
	
	