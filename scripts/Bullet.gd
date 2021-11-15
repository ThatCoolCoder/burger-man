extends Area2D

export var speed := 400
export var move_direction = PI / 2
export var health_multiplier := 10.0
var health
export var frozen := false
export var kills_player := false
export var kills_enemy := false
export (PackedScene) var explode_effect

func _physics_process(delta):
	if frozen:
		return
		
	var movement = Vector2(0, speed)
	movement = movement.rotated(move_direction)
	position += movement * delta * Score.speed_multiplier
	health = scale.x * health_multiplier

func _on_VisibilityNotifier2D_viewport_exited(viewport):
	if not frozen:
		queue_free()
		
func _on_Bullet_area_entered(area: Area2D):
	if frozen:
		return
	
	if kills_player and area.is_in_group("player"):
		explode()
		
	if kills_enemy and area.is_in_group("enemy"):
		var new_health = health - area.health
		if new_health < scale.x * health_multiplier / 2:
			explode()
		set_deferred("health", new_health)
		set_deferred("scale", Vector2.ONE * (new_health / health) * scale.x)

func explode():
	var effect = explode_effect.instance()
	get_parent().add_child(effect)
	effect.position = position
	queue_free()
