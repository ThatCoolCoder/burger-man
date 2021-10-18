extends Area2D

signal dead

export var max_speed := 350
export var acceleration := 750
export var friction := 1000
export (PackedScene) var bullet_prefab
var frozen = false
var alive = true

var velocity = Vector2.ZERO

func _physics_process(delta):
	if frozen or not alive:
		return
		
	walk(delta)
	if Input.is_action_just_pressed("shoot"):
		shoot()
	velocity = velocity.clamped(max_speed)
	
	position += velocity * delta
	
	rotate_to_face_movement()

func walk(delta: float):
	var move_direction := Vector2.ZERO
	move_direction.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	move_direction.y = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))

	move_direction = move_direction.normalized()
	
	# Friction
	if move_direction.x == 0:
		pass
		velocity.x = Utils.converge_value(velocity.x, 0, friction * delta)
	if move_direction.y == 0:
		pass
		velocity.y = Utils.converge_value(velocity.y, 0, friction * delta)
	
	velocity += move_direction * delta * acceleration

func shoot():
	var offset = get_local_mouse_position()
	var bullet = bullet_prefab.instance()
	bullet.move_direction = offset.angle()
	get_tree().root.add_child(bullet)

func rotate_to_face_movement():
	if velocity.length_squared() > 0:
		rotation = velocity.angle() + PI /2

func _on_Player_area_entered(area):
	if not alive:
		return
	
	if area.is_in_group("enemy"):
		print("Ouch!")
		alive = false
		$DieTimer.start()

func _on_DieTimer_timeout():
	emit_signal("dead")
	print("Dead")
