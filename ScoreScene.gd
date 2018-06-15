extends Node2D

var previousScore;
var score;

func _ready():
	score = 0;
	global.currentScore = 0;
	_setCurrentScore();
	pass

func _process(delta):
	score = get_parent().position.x / 100;
	global.currentScore = int(round(score))
	if global.currentScore != previousScore:
		_setCurrentScore();
	pass

func _setCurrentScore():
	previousScore = global.currentScore;
	get_node("ScoreLabel").set_text(str(global.currentScore));
