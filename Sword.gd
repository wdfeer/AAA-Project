extends Node3D


func _on_body_entered(body):
	if body is Player:
		body.damage(20)
