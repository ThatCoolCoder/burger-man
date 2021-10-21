extends Node2D

export (PackedScene) var growth_item_prefab
export var growth_item_rate := 3.0
export var growth_item_max_dist := 1000

func _ready():
	$Player.position = $StartPosition.position

func _process(delta):
	if randf() < growth_item_rate / 60:
		var pos = Vector2(
			rand_range(-growth_item_max_dist, growth_item_max_dist),
			rand_range(-growth_item_max_dist, growth_item_max_dist)
		)
		var growth_item = growth_item_prefab.instance()
		growth_item.position = pos
		add_child(growth_item)
