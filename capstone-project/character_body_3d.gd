extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const MAX_JUMPS = 3 
const MOUSE_SENSITIVITY = 0.003

var jump_count = 0
var spawn_position: Vector3

@onready var pivot = $CameraPivot
@onready var camera = $CameraPivot/Camera3D

var camera_x_rotation = 0.0


func _ready() -> void:
	spawn_position = global_position


func _input(event):
	if event is InputEventMouseMotion:
		# Rotate around player (360°)
		pivot.rotate_y(-event.relative.x * MOUSE_SENSITIVITY)
		
		# Look up/down
		camera_x_rotation += -event.relative.y * MOUSE_SENSITIVITY
		camera_x_rotation = clamp(camera_x_rotation, -1.0, 0.5)
		camera.rotation.x = camera_x_rotation
	
	if event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		jump_count = 0

	if Input.is_action_just_pressed("ui_accept") and jump_count < MAX_JUMPS:
		velocity.y = JUMP_VELOCITY
		jump_count += 1

	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

	# ✅ CAMERA-RELATIVE MOVEMENT (fixed type issue)
	var direction: Vector3 = (pivot.global_transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	direction.y = 0

	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()


func respawn():
	velocity = Vector3.ZERO
	global_position = spawn_position
