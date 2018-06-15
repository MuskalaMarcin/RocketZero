extends CanvasLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var movingObjects
var rocket
var score
signal start_game

func show_message(text):
	$Message.text = text
	$Message.show()
	
func show_score(number):
	$Score.text = str(number)
	$Score.show()
	
func game_over():
	show_message("Game Over")
	score = get_node('../MovingObjects/TimerScene').getCurrentTime()
	show_score(score)
	$ScoreText.show()
	yield($Timer, "timeout")

func _on_Rocket_hit():
	get_node('../').hide()
	game_over()
	$StartButton.show()
	
func _on_StartButton_pressed():
	$StartButton.hide()
	$Message.hide()
	$Score.hide()
	$ScoreText.hide()
	get_node('../MovingObjects/TimerScene').resetTime()
	get_node('../MovingObjects/FuelGauge').resetFuel()
	get_node('../').show()
	get_node('..').new_game()

func _on_FuelGaugeMainNode_hit():
	show_message("Game Over")
	yield($Timer, "timeout")
