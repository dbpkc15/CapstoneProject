extends Node2D

var button_type = null

func _on_start_pressed() -> void:
	button_type = "start"
	$Fade_Transition.show()
	$Fade_Transition/Fade_timer.start()
	$Fade_Transition/AnimationPlayer.play("Fade_In")

func _on_options_pressed() -> void:
	button_type = "options"
	$Fade_Transition.show()
	$Fade_Transition/Fade_timer.start()
	$Fade_Transition/AnimationPlayer.play("Fade_In")

func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_fade_timer_timeout() -> void:
	if button_type == "start" :
		await $Fade_Transition/AnimationPlayer.animation_finished
		get_tree().change_scene_to_file("res://levels.tscn")
		
	elif button_type == "options" :
		await $Fade_Transition/AnimationPlayer.animation_finished
		get_tree().change_scene_to_file("res://options.tscn")
