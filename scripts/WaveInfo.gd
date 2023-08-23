extends Label

@onready var enemy_spawner: EnemySpawner = $"/root/Game/EnemySpawner"

func _process(delta):
	var result: String = "Wave "
	
	if enemy_spawner.enemies_to_spawn == 0:
		result += str(enemy_spawner.current_wave + 1) + " in " + str(int(EnemySpawner.WAVE_INTERVAL - enemy_spawner.wave_timer))
	else:
		result += str(enemy_spawner.current_wave)
	
	text = result
