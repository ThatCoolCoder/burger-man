extends Node2D

export (PackedScene) var growth_item_prefab
export var growth_item_rate := 1.0

func _ready():
	$Player.position = $StartPosition.position
	PlayState.reset()
	PlayState.player = $Player

func _process(delta):
	if randf() < growth_item_rate / 60:
		var growth_item = growth_item_prefab.instance()
		growth_item.radius = 20
		growth_item.position = Utils.random_viewport_edge_pos(get_canvas_transform(),
			get_viewport_rect(), get_canvas_transform().get_scale().x * 100)
		add_child(growth_item)
