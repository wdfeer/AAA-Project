extends Container

@onready var player_stats: PlayerStats = $"../../Player/PlayerStats"

func _ready():
	player_stats.connect("level_up", _on_level_up)
	player_stats.connect("skill_point_used", _on_skill_point_used)

func _on_level_up():
	visible = true
	get_tree().paused = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_skill_point_used():
	visible = false
	get_tree().paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
