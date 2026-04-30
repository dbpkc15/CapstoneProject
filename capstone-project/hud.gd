extends CanvasLayer

@onready var timer = $LevelTimer
@onready var label = $Label
@export var time = 60

var game_over = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start(time)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not game_over:
		label.text = "Time: " + str(int(timer.time_left))
	
func _on_level_timer_timeout():
	game_over = true
	label.text = "Time Is Up!"
	label.visible = true
	await get_tree().create_timer(1.0).timeout
	get_tree().reload_current_scene()
