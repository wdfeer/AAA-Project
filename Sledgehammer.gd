extends Node3D

func _on_body_entered(body):
	if (body.name == "Enemy"):
		body.damage(50)
