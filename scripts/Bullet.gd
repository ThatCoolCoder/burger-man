extends Area2D

export var speed := 400
export var move_direction = PI / 2
var health
export var frozen := false
export var kills := ['enemy']
export (PackedScene) var explode_effect

func _physics_process(delta):
	if frozen:
		return
		
	var movement = Vector2(0, speed)
	movement = movement.rotated(move_direction)
	position += movement * delta * PlayState.speed_multiplier
	health = scale.x * 10

func _on_VisibilityNotifier2D_viewport_exited(viewport):
	if not frozen:
		queue_free()
		
func _on_Bullet_area_entered(area: Area2D):
	if frozen:
		return
	
	# Don't hit the player after just being shot
	if Utils.is_in_one_group(area, kills):
		queue_free()
		var effect = explode_effect.instance()
		get_parent().add_child(effect)
		effect.position = position
