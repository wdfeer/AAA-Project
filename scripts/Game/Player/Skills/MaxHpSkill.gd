extends SkillButton

func apply_upgrade():
	player_stats.max_hp += 5 * lvl

func update_text():
	text = str("MHP\nLVL ", lvl, "\n+", lvl * 5, "%")
