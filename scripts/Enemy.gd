extends Area2D

export var speed := 300
export var player_damage := 10.0
var health
export (float) var points_on_kill = null
export var health_mult = 7
export (PackedScene) var explode_effect
var frozen = false

func _ready():
	if points_on_kill == null:
		points_on_kill = scale.x * 10
	player_damage = scale.x * 20
	health = scale.x * health_mult

func _physics_process(delta):
	if frozen:
		return
		
	var players = get_tree().get_nodes_in_group('player')
	if len(players) != 0:
		move_towards(players[0], delta)
	
func move_towards(entity: Node2D, delta):
	global_position.x = Utils.converge_value(global_position.x, entity.global_position.x, speed * delta * PlayState.speed_multiplier)
	global_position.y = Utils.converge_value(global_position.y, entity.global_position.y, speed * delta * PlayState.speed_multiplier)

func _on_Enemy_area_entered(area):
	if area.is_in_group("bullet"):
		if Utils.is_in_one_group(self, area.kills):
			if not area.frozen and area.health > health:
				queue_free()
				var effect = explode_effect.instance()
				get_parent().add_child(effect)
				effect.position = position
		PlayState.bonus_points += points_on_kill
	if area.is_in_group("player"):
		queue_free()
