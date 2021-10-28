extends Area2D

export var radius := 20.0 setget set_radius
export var speed := 200
export var points_on_kill := 20
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

func _on_Enemy_area_entered(area):
	if area.is_in_group("bullet"):
		queue_free()
		PlayState.bonus_points += points_on_kill

func set_radius(new_radius):
	radius = new_radius
	Utils.set_sprite_size($Sprite, Vector2(radius, radius), $Sprite.texture)
	$CollisionShape2D.shape.extents = Vector2(radius, radius)
