extends CanvasLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func show_message(text):
	$Message.text = text
	$Message.show()
	
func game_over():
	show_message("Game Over")
	yield($Timer, "timeout")


func _on_Rocket_hit():
	game_over()