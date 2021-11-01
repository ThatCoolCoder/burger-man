extends Node

static func converge_value(value: float, target: float, increment: float):
	var difference = target - value
	if abs(difference) < abs(increment):
		return target
	else:
		return value + sign(difference) * increment

static func shake_once(original_pos: Vector2, amplitude: float):
	var rand = Vector2(rand_range(-amplitude, amplitude), rand_range(-amplitude, amplitude))
	return original_pos + rand

static func chunk_list(list: Array, chunk_size: int):
	# chunk list into subarrays of size chunk_size
	var result = []
	var crnt_chunk = []
	for item in list:
		crnt_chunk.append(item)
		if len(crnt_chunk) == chunk_size:
			result.append(crnt_chunk)
			crnt_chunk = []
	return result
	
static func set_sprite_size(sprite: Sprite, size: Vector2, texture: Texture):
	sprite.scale.x = size.x / texture.get_width()
	sprite.scale.y = size.y / texture.get_height()

static func is_in_one_group(node: Node, groups):
	for group in groups:
		if node.is_in_group(group):
			return true
	return false

static func random_viewport_edge_pos(canvas_transform: Transform2D, viewport_rect: Rect2, offset: float = 0.0):
	# Higher offset = positions more in from edge
	var min_pos = -canvas_transform.get_origin() / canvas_transform.get_scale()
	var view_size = viewport_rect.size / canvas_transform.get_scale()
	var max_pos = min_pos + view_size
	var edge = randi() % 4
	# top
	if edge == 0:
		return Vector2(rand_range(min_pos.x, max_pos.x), min_pos.y + offset)
	# right
	elif edge == 1:
		return Vector2(max_pos.x - offset, rand_range(min_pos.y, max_pos.y))
	# bottom
	elif edge == 2:
		return Vector2(rand_range(min_pos.x, max_pos.x), max_pos.y - offset)
	# left
	else:
		return Vector2(min_pos.x + offset, rand_range(min_pos.y, max_pos.y))
