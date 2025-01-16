extends Camera3D

@export var mouse_sensitivity : float = 0.005
var mouse_captured : bool = false

func _input(event: InputEvent) -> void:
	
	if Input.is_action_pressed("Toggle Mouse Capture"):
		mouse_captured = !mouse_captured
	
	if mouse_captured:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	if event is InputEventMouseMotion:
		get_parent_node_3d().rotate(Vector3.UP, -event.relative.x * mouse_sensitivity)
		get_parent_node_3d().rotate_object_local(Vector3.RIGHT, -event.relative.y * mouse_sensitivity)
