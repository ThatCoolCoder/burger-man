extends Node

var min_scale := 1
var max_scale := 2
var min_player_radius := 0
var max_player_radius := 1000
var spawn_chance := 1.0 / 60.0
var prefab = null

func _init(i_min_scale, i_max_scale, i_min_player_radius, i_max_player_radius, i_spawn_chance, i_prefab):
	min_scale = i_min_scale
	max_scale = i_max_scale
	min_player_radius = i_min_player_radius
	max_player_radius = i_max_player_radius
	spawn_chance = i_spawn_chance
	prefab = i_prefab
