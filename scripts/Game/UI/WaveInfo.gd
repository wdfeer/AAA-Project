extends Label

@onready var enemy_spawner: EnemySpawner = $"/root/Game/EnemySpawner"

func _process(delta):
	var result: String = "Wave "
	
	if enemy_spawner.enemies_to_spawn == 0:
		result += str(enemy_spawner.current_wave + 1) + ": Press [Enter]"
	else:
		result += str(enemy_spawner.current_wave)
	
	text = result
