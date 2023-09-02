extends PanelContainer

@onready var player_stats: PlayerStats = $"../../Player/PlayerStats"

func _ready():
	player_stats.connect("level_up", _on_level_up)

func _on_level_up():
	visible = true
	get_tree().paused = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
