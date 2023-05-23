extends Node3D

@onready var damage_label: Label = $"../../../UI/DamageLabel"

func _on_body_entered(body):
	if (body.name == "Enemy"):
		damage(body)

func damage(enemy):
	var dmg = get_damage()
	damage_label.text = "%0.1f" % dmg
	enemy.damage(dmg)



var old_global_position: Vector3

func _physics_process(delta):
	old_global_position = global_position

func get_damage():
	var velocity = (global_position - old_global_position) * 60
	return velocity.length()
