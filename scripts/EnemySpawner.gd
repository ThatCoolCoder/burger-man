extends Node2D

const EnemyType = preload("res://scripts/EnemyType.gd")

export (PackedScene) var enemy_prefab
var player

var enemy_types = [
	EnemyType.new(0.6, 1.0,
		0, 200,
		0.3 / 60.0, preload("res://scenes/enemies/TomatoEnemy.tscn")),
	EnemyType.new(1, 1.5,
		90, 100000,
		0.15 / 60.0, preload("res://scenes/enemies/RangedCarrotEnemy.tscn")),
	EnemyType.new(1, 1.5,
		110, 100000,
		0.15 / 60.0, preload("res://scenes/enemies/FastEnemy.tscn")),
	EnemyType.new(0.8, 1.2,
		130, 100000,
		0.15 / 60.0, preload("res://scenes/enemies/PumpkinEnemy.tscn"))
]

func _process(delta: float):
	# Godot knows no function pointers (maybe in 4.0?), so I have to do this
	
	for enemy_type in enemy_types:
		if enemy_type.min_player_radius < player.radius and \
			player.radius < enemy_type.max_player_radius and \
			randf() < enemy_type.spawn_chance:
				
			var enemy = enemy_type.prefab.instance()
			enemy.scale = Vector2.ONE * rand_range(enemy_type.min_scale, enemy_type.max_scale)
			enemy.position = Utils.random_viewport_edge_pos(get_canvas_transform(),
				get_viewport_rect(), get_canvas_transform().get_scale().x * -100)
			add_child(enemy)
