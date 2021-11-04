extends CanvasLayer

var display_size = null
var display_bonus_points = null
export var max_size_change_rate = 75
export var max_bonus_points_change_rate = 200
export var score_multiplier = 5

func _process(delta: float):
	update_size_label(delta)
	update_bonus_points_label(delta)
	update_total_score_label(delta)

func update_size_label(delta: float):
	if display_size == null:
		display_size = PlayState.player.radius * score_multiplier
	display_size = Utils.converge_value(display_size, PlayState.player.radius * score_multiplier, max_size_change_rate * delta)
	$Size.text = "Size: %s" % round(display_size)
	
func update_bonus_points_label(delta: float):
	if display_bonus_points == null:
		display_bonus_points = PlayState.bonus_points * score_multiplier
	display_bonus_points = Utils.converge_value(display_bonus_points, PlayState.bonus_points * score_multiplier, max_bonus_points_change_rate * delta)
	$BonusPoints.text = "Bonus points: %s" % round(display_bonus_points)

func update_total_score_label(delta: float):
	$TotalScore.text = "Total score: %s" % round(display_bonus_points + display_size)
