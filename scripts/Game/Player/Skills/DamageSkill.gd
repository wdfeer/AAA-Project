extends SkillButton

func apply_upgrade():
	player_stats.damage_mult += 0.05 * lvl

func update_text():
	text = str("DMG\nLVL ", lvl, "\n+", lvl * 5, "%")
