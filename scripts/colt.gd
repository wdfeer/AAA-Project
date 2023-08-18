extends Node3D

const attack_cooldown: float
var attack_timer: float



func _unhandled_input(event):
	if event.is_action_pressed("attack"):
		
