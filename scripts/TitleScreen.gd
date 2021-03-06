extends Node2D

export (Array, String) var project_urls
export (PackedScene) var background_burger_prefab
export (int) var background_burger_amount

func _ready():
	create_background_burgers()
	if Score.load_high_score() > 0:
		$CanvasLayer/ScoreInfo/Score.text = "High score: %s" % floor(Score.load_high_score() * Score.display_multiplier)
	else:
		$CanvasLayer/ScoreInfo.hide()

func _on_PlayButton_pressed():
	get_tree().change_scene("res://scenes/Main.tscn")

func _on_AdvertisingLink_pressed():
	for project_url in project_urls:
		OS.shell_open(project_url)

func create_background_burgers():
	var viewport_rect = get_viewport_rect()
	for _i in range(background_burger_amount):
		var burger = background_burger_prefab.instance()
		burger.position = Vector2(
			rand_range(0, viewport_rect.size.x),
			rand_range(0, viewport_rect.size.y)
		)
		add_child(burger)


func _on_ResetHighScoreButton_pressed():
	$CanvasLayer/ScoreInfo.hide()
	Score.save_high_score(0)
