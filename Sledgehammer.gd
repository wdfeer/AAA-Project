extends Node3D

@onready var damage_label: Label = $"../../../UI/DamageLabel"

func _on_body_entered(body):
	if (body.name == "Enemy"):
		damage(body)

func damage(enemy):
	var dmg = get_damage()
	damage_label.text = "%0.1f" % dmg
	enemy.damage(dmg)



var old_global_positions: PackedVector3Array = [null, null, null]

func _physics_process(delta):
	old_global_positions = [global_position, old_global_positions[0], old_global_positions[1]]

func get_damage():
	var velocity = (global_position - old_global_positions[2]) * 60 / 3
	return velocity.length()
