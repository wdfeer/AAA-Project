class_name Weapon
extends Node3D

@onready var damage_label: FadingLabel = $"../../../UI/DamageLabel"


func get_attack_cooldown():
	return 1
var attack_timer: float

func _input(event):
	if event.is_action_pressed("attack") and attack_timer > get_attack_cooldown():
		attack()
		attack_timer = 0

func _physics_process(delta):
	if (attack_timer <= get_attack_cooldown()):
		attack_timer += delta

func attack():
	push_error("attack Method not Implemented")

func damage(enemy: Enemy, amount: float):
	damage_label.show_text("%0.1f" % amount) 
	enemy.damage(amount)
