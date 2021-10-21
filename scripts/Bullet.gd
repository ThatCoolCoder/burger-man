extends Area2D

export var speed := 400
export var move_direction = PI / 2
export var radius := 10.0 setget set_radius
export var frozen := false

func _physics_process(delta):
	if frozen:
		return
		
	var movement = Vector2(0, speed)
	movement = movement.rotated(move_direction)
	position += movement * delta


func _on_VisibilityNotifier2D_viewport_exited(viewport):
	if not frozen:
		queue_free()

func set_radius(new_radius):
	radius = new_radius
	Utils.set_sprite_size($Sprite, Vector2(radius * 2, radius * 2), $Sprite.texture)


func _on_Bullet_area_entered(area):
	# Don't hit the player after just being shot
	if not area.is_in_group("player"):
		queue_free()
