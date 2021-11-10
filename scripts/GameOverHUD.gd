extends Control

func _process(delta: float):
	$Score.text = "You scored: %s" % floor(Score.crnt_score * Score.display_multiplier)
	$HighScore.text = "Your high score: %s" % floor(Score.load_high_score() * Score.display_multiplier)
	
	if floor(Score.crnt_score) >= floor(Score.load_high_score()):
		$NewHighScore.show()
	else:
		$NewHighScore.hide()


func _on_ContinueButton_pressed():
	get_tree().change_scene("res://scenes/TitleScreen.tscn")
