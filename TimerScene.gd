extends Node2D

var currentTime;
var previousTime;
var time;

func _ready():
	time = 0;
	currentTime = 0;
	_setCurrentTime();
	pass

func _process(delta):
	time += delta;
	currentTime = int(round(time))
	if currentTime != previousTime:
		_setCurrentTime();
		emit_signal("time_tick", currentTime);
	pass

func _setCurrentTime():
	previousTime = currentTime;
	get_node("TimerLabel").set_text(str(currentTime));