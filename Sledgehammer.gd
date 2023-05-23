extends Node3D

func _on_body_entered(body):
	if (body.name == "Enemy"):
		body.damage(get_damage())

var old_global_position: Vector3

func _physics_process(delta):
	old_global_position = global_position

func get_damage():
	var velocity = global_position - old_global_position
	return 100 * velocity.length()
