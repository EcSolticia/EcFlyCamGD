extends Camera3D

@export var mouse_sensitivity : float = 1

func _input(event: InputEvent) -> void:
	
	if event is InputEventMouseMotion:
		get_parent_node_3d().rotate(Vector3.UP, -event.relative.x * mouse_sensitivity)
		get_parent_node_3d().rotate_object_local(Vector3.RIGHT, -event.relative.y * mouse_sensitivity)
