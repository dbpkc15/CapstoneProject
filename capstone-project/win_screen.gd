extends Node2D

var button_type = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_main_menu_pressed() -> void:
	button_type = "MainMenu"
	$Fade_Transition.show()
	$Fade_Transition/Fade_timer.start()
	$Fade_Transition/Fade_timer.timeout.connect(_on_fade_timer_timeout)
	$Fade_Transition/AnimationPlayer.play("Fade_In")

func _on_next_level_pressed() -> void:
	if LevelManager.currentLevelIndex == 0:
		get_tree().change_scene_to_file("res://Level_1.tscn")
		LevelManager.currentLevelIndex = 1
	elif LevelManager.currentLevelIndex == 1:
		get_tree().change_scene_to_file("res://Level_2.tscn")
		LevelManager.currentLevelIndex = 2
	elif LevelManager.currentLevelIndex == 2:
		get_tree().change_scene_to_file("res://Level_3.tscn")
		LevelManager.currentLevelIndex =3
	else:
		get_tree().change_scene_to_file("res://Game_Complete.tscn")
	button_type = "NextLevel"
	$Fade_Transition.show()
	$Fade_Transition/Fade_timer.start()
	$Fade_Transition/Fade_timer.timeout.connect(_on_fade_timer_timeout)
	$Fade_Transition/AnimationPlayer.play("Fade_In")
	
func _on_fade_timer_timeout() -> void:
	if button_type == "MainMenu" :
		await $Fade_Transition/AnimationPlayer.animation_finished
		get_tree().change_scene_to_file("res://main_menu.tscn")
		
	elif button_type == "NextLevel" :
		await $Fade_Transition/AnimationPlayer.animation_finished
		
@onready var score_label = $ScoreLabel

func _ready():
	score_label.text = "+" + str(GameManager.optional_coins_collected)
	GameManager.optional_coins_collected = 0
