extends Area3D

const ROT_SPEED = 2

func _ready():
	pass 


func _process(delta):
	rotate_y(deg_to_rad(ROT_SPEED))

func _on_body_entered(body: Node3D) -> void:
	if body is CharacterBody3D:
	
		GameManager.optional_coins_collected += 1
		
		body.add_score(1)
		
		var popup = preload("res://score_popup.tscn").instantiate()
		get_tree().current_scene.add_child(popup)
		
		popup.global_position = global_position
		
		queue_free()
