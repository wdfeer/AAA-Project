class_name HpHUD
extends Control

@onready var hp_bar: TextureProgressBar = $HpBar
@onready var hp_label: Label = $HpLabel

func set_hp(value: int):
	hp_bar.value = value
	hp_label.text = str(value)

@onready var player_stats: PlayerStats = $"../../Player/PlayerStats"

func _ready():
	player_stats.post_update_skills.connect(update_max_hp)

func update_max_hp():
	hp_bar.max_value = player_stats.max_hp
