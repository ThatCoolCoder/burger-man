extends Node

var min_radius := 30.0
var max_radius := 45.0
var min_player_radius := 0
var max_player_radius := 1000
var spawn_chance := 1.0 / 60.0
var prefab = null

func _init(i_min_radius, i_max_radius, i_min_player_radius, i_max_player_radius, i_spawn_chance, i_prefab):
	min_radius = i_min_radius
	max_radius = i_max_radius
	min_player_radius = i_min_player_radius
	max_player_radius = i_max_player_radius
	spawn_chance = i_spawn_chance
	prefab = i_prefab
