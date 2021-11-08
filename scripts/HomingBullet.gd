extends "res://scripts/Bullet.gd"

func _physics_process(delta: float):
	var targets = get_tree().get_nodes_in_group(kills[0])
	if len(targets) != 0:
		var target = targets[0]
		look_at(target.position)
		rotation -= PI / 2
		move_direction = rotation
	
	._physics_process(delta)
