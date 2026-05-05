extends Label3D

var float_speed = 1.5
var lifetime = 1.0

func _process(delta):
	position.y += float_speed * delta
	lifetime -= delta
	
	if lifetime <= 0:
		queue_free()
