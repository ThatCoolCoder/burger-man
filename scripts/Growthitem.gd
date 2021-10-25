extends Node2D

export var radius := 20.0 setget set_radius

func set_radius(new_radius):
	radius = new_radius
	Utils.set_sprite_size($Sprite, Vector2(radius * 2, radius * 2), $Sprite.texture)
	$CollisionShape2D.shape.radius = radius

func _on_GrowthItem_area_entered(area):
	if area.is_in_group("player"):
		queue_free()
