extends Area3D

const ROT_SPEED = 2

func _process(delta):
	rotate_y(deg_to_rad(ROT_SPEED))

func _on_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		GameManager.coins_collected += 1
		queue_free()
