extends Node3D

@onready var timer = $Level1Timer
@onready var label = $CanvasLayer/Label

var game_over = false

func _ready() -> void:
	timer.start(60)

	GameManager.coins_collected = 0
	GameManager.total_coins = get_tree().get_nodes_in_group("Coins").size()
	
	print("Total coins:", GameManager.total_coins)
	
func _process(delta):
	if not game_over:
		label.text = "Time: " + str(int(timer.time_left))	
	
func _on_level_1_timer_timeout():
	game_over = true
	label.text = "Time Is Up!"
	label.visible = true
