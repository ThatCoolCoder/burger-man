extends Area2D

export var speed := 200
var frozen = false

func _physics_process(delta):
	if frozen:
		return
		
	var players = get_tree().get_nodes_in_group('player')
	if len(players) != 0:
		move_towards(players[0], delta)
	
func move_towards(entity: Node2D, delta):
	global_position.x = Utils.converge_value(global_position.x, entity.global_position.x, speed * delta)
	global_position.y = Utils.converge_value(global_position.y, entity.global_position.y, speed * delta)
