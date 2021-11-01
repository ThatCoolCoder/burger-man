extends Node2D

const EnemyType = preload("res://scripts/EnemyType.gd")

export (PackedScene) var enemy_prefab

var enemy_types = {
	"normal" : EnemyType.new(30, 45,
		0, 200,
		0.3 / 60.0, preload("res://scenes/Enemy.tscn")),
	"big" : EnemyType.new(90, 180,
		150, 100000,
		0.3 / 60.0, preload("res://scenes/Enemy.tscn"))
}

func _process(delta: float):
	# Godot knows no function pointers (maybe in 4.0?), so I have to do this
	
	for enemy_type_name in enemy_types.keys():
		var enemy_type = enemy_types[enemy_type_name]
		if enemy_type.min_player_radius < PlayState.player.radius and \
			PlayState.player.radius < enemy_type.max_player_radius and \
			randf() < enemy_type.spawn_chance:
				
			var enemy = enemy_type.prefab.instance()
			enemy.radius = rand_range(enemy_type.min_radius, enemy_type.max_radius)
			enemy.position = Utils.random_viewport_edge_pos(get_canvas_transform(),
				get_viewport_rect(), get_canvas_transform().get_scale().x * -100)
			add_child(enemy)
