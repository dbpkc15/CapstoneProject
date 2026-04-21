extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Fade_Transition/AnimationPlayer.play("Fade_Out")


func _on_level_1_pressed() -> void:
	get_tree().change_scene_to_file("res://Level_1.tscn")


func _on_level_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Level_2.tscn")


func _on_level_3_pressed() -> void:
	get_tree().change_scene_to_file("res://Level_3.tscn")
