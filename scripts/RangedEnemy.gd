extends "res://scripts/Enemy.gd"

export var visual_range := 500
export (PackedScene) var bullet_prefab
export var firing_interval := 1

func _ready():
	$Timer.wait_time = firing_interval
	._ready()

func _on_Timer_timeout():
	var bullet = bullet_prefab.instance()
	get_parent().add_child(bullet)
	bullet.position = position
