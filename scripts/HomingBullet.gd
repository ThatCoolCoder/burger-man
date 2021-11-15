extends "res://scripts/Bullet.gd"

func _physics_process(delta: float):
	var target_group_name = ""
	if kills_player:
		target_group_name = "player"
	if kills_enemy:
		target_group_name = "enemy"
	var targets = get_tree().get_nodes_in_group(target_group_name)
	if len(targets) != 0:
		var target = targets[0]
		look_at(target.position)
		rotation -= PI / 2
		move_direction = rotation
	
	._physics_process(delta)
