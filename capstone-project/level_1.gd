extends Node3D

func _ready() -> void:
	LevelManager.currentLevelIndex = 1

	GameManager.coins_collected = 0
	GameManager.total_coins = get_tree().get_nodes_in_group("Coins").size()
	
	print("Total coins:", GameManager.total_coins)

	AudioController.play_music()
