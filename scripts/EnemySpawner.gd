extends Node2D

const EnemyType = preload("res://scripts/EnemyType.gd")

export (PackedScene) var enemy_prefab

var enemy_types = {
	"normal" : EnemyType.new(0.8, 1.2,
		0, 200,
		0.3 / 60.0, preload("res://scenes/enemies/Enemy.tscn")),
	"ranged" : EnemyType.new(1, 1.5,
		110, 100000,
		0.3 / 60.0, preload("res://scenes/enemies/RangedEnemy.tscn")),
	"big" : EnemyType.new(4, 8,
		150, 100000,
		0.3 / 60.0, preload("res://scenes/enemies/Enemy.tscn"))
}

func _process(delta: float):
	# Godot knows no function pointers (maybe in 4.0?), so I have to do this
	
	for enemy_type_name in enemy_types.keys():
		var enemy_type = enemy_types[enemy_type_name]
		if enemy_type.min_player_radius < PlayState.player.radius and \
			PlayState.player.radius < enemy_type.max_player_radius and \
			randf() < enemy_type.spawn_chance:
				
			var enemy = enemy_type.prefab.instance()
			enemy.scale = Vector2.ONE * rand_range(enemy_type.min_scale, enemy_type.max_scale)
			enemy.position = Utils.random_viewport_edge_pos(get_canvas_transform(),
				get_viewport_rect(), get_canvas_transform().get_scale().x * -100)
			add_child(enemy)
