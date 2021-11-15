extends Node2D

export (PackedScene) var growth_item_prefab
export var growth_item_rate := 2.5

func _ready():
	$Player.position = $StartPosition.position
	$EnemySpawner.player = $Player
	Score.crnt_score = 0
	
	if not Score.load_played_before():
		$HelpMenuTimer.start()

func _process(delta):
	if randf() < growth_item_rate / 60 and $Player.alive:
		var growth_item = growth_item_prefab.instance()
		growth_item.radius = 20
		growth_item.position = Utils.random_viewport_edge_pos(get_canvas_transform(),
			get_viewport_rect(), get_canvas_transform().get_scale().x * 100)
		add_child(growth_item)


func _on_Player_dead():
	if Score.crnt_score > Score.load_high_score():
		Score.save_high_score(Score.crnt_score)
	$CanvasLayer/HUD.hide()
	$CanvasLayer/GameOverHUD.show()


func _on_HelpMenuTimer_timeout():
	$CanvasLayer/HUD/HelpMenu.popup()
	Score.save_played_before(true)
