extends "res://scripts/Enemy.gd"

export var rotate_speed := PI * 2

func _physics_process(delta: float):
	if frozen:
		return
		
	var players = get_tree().get_nodes_in_group('player')
	if len(players) != 0:
		var player = players[0]
		if player.position.x < position.x:
			rotation -= rotate_speed * delta
		else:
			rotation += rotate_speed * delta
		
	._physics_process(delta)
