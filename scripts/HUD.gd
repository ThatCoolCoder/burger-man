extends Control

var display_score = null
export var max_score_change_rate = 100

func _process(delta: float):
	if display_score == null:
		display_score = Score.crnt_score * Score.display_multiplier
	display_score = Utils.converge_value(display_score,
		Score.crnt_score * Score.display_multiplier,
	max_score_change_rate * delta)
	$Score.text = "Score: %s" % floor(display_score)


func _on_HelpButton_pressed():
	$HelpMenu.popup()


func _on_CloseButton_pressed():
	$HelpMenu.hide()

func _on_HelpMenu_about_to_show():
	get_tree().paused = true

func _on_HelpMenu_popup_hide():
	get_tree().paused = false
