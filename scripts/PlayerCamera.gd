extends Camera3D

const MOUSE_SENSITIVITY = 0.5;

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _input(event):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotation_degrees.x += event.relative.y * MOUSE_SENSITIVITY * -1;
		rotation_degrees.y += event.relative.x * MOUSE_SENSITIVITY * -1;
		rotation_degrees.x = clamp(rotation_degrees.x, -90, 90);
		
