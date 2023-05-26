extends Node3D

@onready var damage_label: FadingLabel = $"../../../UI/DamageLabel"

func _on_body_entered(body):
	if (body is Enemy):
		damage(body)

func damage(enemy: Enemy):
	var dmg = get_damage(enemy)
	damage_label.show_text("%0.1f" % dmg) 
	enemy.damage(dmg)



var old_global_positions: PackedVector3Array = [null, null, null]

func _physics_process(delta):
	old_global_positions = [global_position, old_global_positions[0], old_global_positions[1]]

func get_damage(enemy: Enemy):
	var velocity = (global_position - old_global_positions[2]) * 60 / len(old_global_positions)
	return velocity.length() + enemy.velocity.length()
