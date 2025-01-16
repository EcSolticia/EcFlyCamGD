extends CharacterBody3D

var forward : Vector3 = Vector3(0, 0, -1) # tracks the global direction of "forward"
var right : Vector3 = Vector3(1, 0, 0)

@export var movement_sensitivity : float = 1
@export var speed_up_scale : float = 2

@onready var cam_node = get_node("Cam")

func _physics_process(delta: float) -> void:
	
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
	if Input.is_action_pressed("Speed Up"):
		speed_up = true
	
	# apply input
	if speed_up:
		velocity += dir * movement_sensitivity * speed_up_scale
	else:
		velocity += dir * movement_sensitivity
		
	move_and_slide()
