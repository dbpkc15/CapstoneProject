extends Node3D

@onready var timer = $Level3Timer
@onready var label = $CanvasLayer/Label

var game_over = false

func _ready() -> void:
	timer.start(30)

func _process(delta):
	if not game_over:
		label.text = "Time: " + str(int(timer.time_left))
	
func _on_level_3_timer_timeout():
	game_over = true
	label.text = "Time Is Up!"
	label.visible = true
	get_tree().paused = true
	
