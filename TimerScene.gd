extends Node2D

var previousTime;
var time;

func _ready():
	time = 0;
	global.currentTime = 0;
	_setCurrentTime();
	pass

func _process(delta):
	time += delta;
	global.currentTime = int(round(time))
	if global.currentTime != previousTime:
		_setCurrentTime();
	pass

func _setCurrentTime():
	previousTime = global.currentTime;
	get_node("TimerLabel").set_text(str(global.currentTime));
	
func getCurrentTime():
	return global.currentTime;