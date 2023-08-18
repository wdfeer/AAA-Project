extends Weapon

func _on_body_entered(body):
	if (visible and body is Enemy):
		damage(body, get_damage(body))


var old_global_positions: PackedVector3Array = [null, null, null]

func _physics_process(delta):
	old_global_positions = [global_position, old_global_positions[0], old_global_positions[1]]

func get_damage(enemy: Enemy):
	var velocity = (global_position - old_global_positions[2]) * 60 / len(old_global_positions)
	return velocity.length() + enemy.velocity.length()
