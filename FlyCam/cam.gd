extends Camera3D

@onready var m_s : float = get_parent_node_3d().mouse_sensitivity

func _input(event: InputEvent) -> void:
	
	if Input.is_action_pressed("Toggle Mouse Capture"):
		get_parent().mouse_captured = !get_parent().mouse_captured
	
	if get_parent().mouse_captured:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	if event is InputEventMouseMotion:
		get_parent().rotate(Vector3.UP, -event.relative.x * m_s)
		get_parent().rotate_object_local(Vector3.RIGHT, -event.relative.y * m_s)
