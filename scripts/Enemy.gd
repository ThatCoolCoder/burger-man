extends Area2D

export var speed := 300
export var player_damage_mult := 30.0
var player_damage
export var health_mult := 7.0
var health
export (float) var points_on_kill_mult = 10.0
var points_on_kill
export (PackedScene) var explode_effect
export var explode_effect_scale_mult := 1.0
var frozen = false

func _ready():
	points_on_kill = scale.x * points_on_kill_mult
	player_damage = scale.x * player_damage_mult
	health = scale.x * health_mult

func _physics_process(delta):
	if frozen:
		return
		
	var players = get_tree().get_nodes_in_group('player')
	if len(players) != 0:
		move_towards(players[0], delta)
	
func move_towards(entity: Node2D, delta):
	global_position.x = Utils.converge_value(global_position.x, entity.global_position.x, speed * delta * Score.speed_multiplier)
	global_position.y = Utils.converge_value(global_position.y, entity.global_position.y, speed * delta * Score.speed_multiplier)

func _on_Enemy_area_entered(area):
	if area.is_in_group("bullet"):
		if Utils.is_in_one_group(self, area.kills):
			if not area.frozen and area.health > health:
				queue_free()
				var effect = explode_effect.instance()
				get_parent().add_child(effect)
				effect.scale = Vector2.ONE * scale.x * explode_effect_scale_mult
				effect.position = position
				Score.crnt_score += points_on_kill
	if area.is_in_group("player"):
		queue_free()
