class_name weapon
extends Node3D

func get_attack_cooldown():
	return 1
var attack_timer: float

func _unhandled_input(event):
	if event.is_action_pressed("attack") and attack_timer > get_attack_cooldown():
		attack()

func _physics_process(delta):
	if (attack_timer <= get_attack_cooldown()):
		attack_timer += delta

func attack():
	push_error("attack Method not Implemented")
