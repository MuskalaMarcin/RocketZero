extends CanvasLayer

func _ready():
	get_node("ScoreLabel").set_text(str(global.currentScore))
	get_node("TimeLabel").set_text(str(global.currentTime))
	
func _on_RestartButton_pressed():
	get_tree().change_scene("res://Main.tscn")