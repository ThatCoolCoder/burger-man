extends Area2D

signal dead

export var max_speed := 350
export var acceleration := 750
export var friction := 1000

export var starting_radius := 60.0
var radius := starting_radius setget set_radius
export var growth_rate := 0.35
var max_zoom_rate = 0.2
var growth_factor := 1.0
onready var original_collision_polygon = $"CollisionPolygon2D".polygon

export var bullet_offset = Vector2(0, -64)
export (PackedScene) var bullet_prefab
export var bullet_starting_radius := 10.0
export var bullet_charge_rate := 10.0
export var max_bullet_radius := 30.0
var crnt_bullet = null

var frozen = false
var alive = true

var velocity = Vector2.ZERO

func _physics_process(delta):
	if frozen or not alive:
		return
	
	walk(delta)
	velocity = velocity.clamped(max_speed)
	
	position += velocity * delta
	
	if Input.is_action_just_pressed("shoot"):
		start_charging_shoot()
	if Input.is_action_just_released("shoot"):
		shoot()
	if Input.is_action_pressed("shoot"):
		charge_shoot(delta)
	
	rotate_to_face_mouse()
	position_bullet()
	update_camera_zoom(delta)

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

func start_charging_shoot():
	if crnt_bullet == null:
		crnt_bullet = bullet_prefab.instance()
		crnt_bullet.frozen = true
		crnt_bullet.radius = bullet_starting_radius * growth_factor
		add_child(crnt_bullet)

func shoot():
	if crnt_bullet != null:
		var offset = get_global_mouse_position() - global_position
		remove_child(crnt_bullet)
		crnt_bullet.frozen = false
		crnt_bullet.move_direction = offset.angle() - PI / 2
		var true_bullet_offset = bullet_offset * growth_factor
		crnt_bullet.rotation = crnt_bullet.move_direction + PI
		crnt_bullet.global_position = global_position + true_bullet_offset.rotated(global_rotation)
		get_tree().root.add_child(crnt_bullet)
		set_radius(radius - crnt_bullet.radius)
		crnt_bullet = null

func charge_shoot(delta):
	if crnt_bullet != null:
		crnt_bullet.radius += bullet_charge_rate * delta * growth_factor
		crnt_bullet.radius = min(crnt_bullet.radius, max_bullet_radius * growth_factor)

# View things run every frame
# ---------------------------

func rotate_to_face_mouse():
	rotation = (get_global_mouse_position() - global_position).angle() + PI / 2

func position_bullet():
	if crnt_bullet != null:
		crnt_bullet.position = bullet_offset * growth_factor

func update_camera_zoom(delta):
	var true_zoom_rate = $Camera2D.zoom.x * max_zoom_rate * delta
	var zoom = Utils.converge_value($Camera2D.zoom.x, growth_factor, true_zoom_rate)
	$Camera2D.zoom.x = zoom
	$Camera2D.zoom.y = zoom

# Signals
# -------

func _on_Player_area_entered(area):
	if not alive:
		return
	
	if area.is_in_group("enemy"):
		print("Ouch!")
		alive = false
		$DieTimer.start()
	if area.is_in_group("growth_item"):
		set_radius(radius + area.radius * growth_rate)

func _on_DieTimer_timeout():
	emit_signal("dead")
	print("Dead")

func set_radius(new_radius):
	radius = new_radius
	growth_factor = radius / starting_radius
	
	# scale collision polygon
	var polygon = original_collision_polygon
	for i in polygon.size():
		polygon.set(i, polygon[i] * growth_factor)
	$CollisionPolygon2D.set_deferred('polygon', polygon) # causes error without set_deferred
		
	Utils.set_sprite_size($Sprite, Vector2(radius * 2, radius * 2), $Sprite.texture)
