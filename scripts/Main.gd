extends Node2D

export (PackedScene) var growth_item_prefab
export var growth_item_rate := 1.0
export (PackedScene) var enemy_prefab
export var enemy_rate = 0.3

func _ready():
	$Player.position = $StartPosition.position

func _process(delta):
	if randf() < growth_item_rate / 60:
		var growth_item = growth_item_prefab.instance()
		add_child(growth_item)
		growth_item.radius = 20
		growth_item.position = random_viewport_edge_pos(get_canvas_transform().get_scale().x * 100)
	if randf() < enemy_rate / 60:
		var enemy = enemy_prefab.instance()
		add_child(enemy)
		enemy.position = random_viewport_edge_pos(get_canvas_transform().get_scale().x * -100)
		
func random_viewport_edge_pos(offset: float = 0.0):
	# Higher offset = positions more in from edge
	var ctrans = get_canvas_transform()
	var min_pos = -ctrans.get_origin() / ctrans.get_scale()
	var view_size = get_viewport_rect().size / ctrans.get_scale()
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
