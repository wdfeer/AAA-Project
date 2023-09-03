class_name SkillButton
extends Button

@onready var player_stats: PlayerStats = $"/root/Game/Player/PlayerStats"

var lvl: int = 0

func _ready():
	update_text()

func _pressed():
	if player_stats.skill_points < get_cost():
		return
	player_stats.update_skills.connect(apply_upgrade)
	player_stats.deduct_skill_points(get_cost())
	lvl += 1
	update_text()

func get_cost():
	return 1

func apply_upgrade():
	push_error("apply_upgrade function not implemented!")

func update_text():
	push_error("update_text function not implemented!")
