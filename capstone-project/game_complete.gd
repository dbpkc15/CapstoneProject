extends Node2D

var button_type = null

func _on_main_menu_pressed() -> void:
	button_type = "MainMenu"
	$Fade_Transition.show()
	$Fade_Transition/Fade_timer.start()
	$Fade_Transition/Fade_timer.timeout.connect(_on_fade_timer_timeout)
	$Fade_Transition/AnimationPlayer.play("Fade_In")

func _on_fade_timer_timeout() -> void:
	if button_type == "MainMenu" :
		await $Fade_Transition/AnimationPlayer.animation_finished
		get_tree(). change_scene_to_file("res://main_menu.tscn")
