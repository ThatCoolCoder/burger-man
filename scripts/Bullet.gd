extends Area2D

export var speed := 400
export var move_direction = PI / 2
export var radius := 50

# Called when the node enters the scene tree for the first time.
func _ready():
	var sprite_scale = $Sprite.texture.get_width() / (radius * 2)
	$Sprite.scale = Vector2(sprite_scale, sprite_scale)
	$CollisionShape2D.shape.radius = radius
	print(sprite_scale)

func _physics_process(delta):
	var movement = Vector2(0, speed)
	movement = movement.rotated(move_direction)
	position += movement * delta
