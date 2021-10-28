extends CPUParticles2D

func _ready():
	emitting = true
	
func _process(delta: float):
	if not emitting:
		queue_free()
