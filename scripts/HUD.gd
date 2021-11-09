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
