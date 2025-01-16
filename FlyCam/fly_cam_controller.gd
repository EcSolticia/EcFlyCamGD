extends CharacterBody3D

@export var forward : Vector3 = Vector3(0, 0, -1) # tracks the direction of "forward" as represented globally
@export var right : Vector3 = Vector3(1, 0, 0)

@export var movement_sensitivity : float = 3
@export var speed_up_scale : float = 3

@export var mouse_sensitivity : float = 0.005
@export var mouse_captured : bool = false

@onready var cam_node = get_node("Cam")

func _physics_process(delta: float) -> void:
	
	# reset velocity
	velocity = Vector3()
	
	# updates "forward" and "right"
	forward = -get_global_transform().basis.z
	right = get_global_transform().basis.x
	
	# handle input
	var dir : Vector3 = Vector3()
	var speed_up : bool = false
	if Input.is_action_pressed("Forward"):
		dir = forward
	if Input.is_action_pressed("Backward"):
		dir -= forward
	if Input.is_action_pressed("Right"):
		dir += right
	if Input.is_action_pressed("Left"):
		dir -= right
	if Input.is_action_pressed("Up"):
		dir += Vector3.UP
	if Input.is_action_pressed("Down"):
		dir += Vector3.DOWN
	if Input.is_action_pressed("Speed Up"):
		speed_up = true
	
	# apply input
	if speed_up:
		velocity += dir * movement_sensitivity * speed_up_scale
	else:
		velocity += dir * movement_sensitivity
		
	move_and_slide()
