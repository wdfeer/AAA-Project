class_name PlayerStats
extends Node

@onready var XpHUD: XpHUD = $"../../UI/XpHUD"

func _ready():
	$"../../EnemySpawner".connect("enemy_died", _on_enemy_death)


var xp_progress: int = 0
var lvl: int = 0

func update_lvl():
	var required = get_xp_for_lvl(lvl + 1)
	while (xp_progress >= required):
		xp_progress -= required
		lvl += 1
		required = get_xp_for_lvl(lvl + 1)
		
		skill_points += 1
		level_up.emit()

func get_xp_for_lvl(lvl: int):
	return int(pow(1.5, lvl) + 6)

func update_xp_display():
	update_lvl()
	XpHUD.set_display(xp_progress / float(get_xp_for_lvl(lvl + 1)), lvl)

func add_xp(amount: int):
	xp_progress += amount
	update_xp_display()


var skill_points: int = 0

func deduct_skill_points(amount: int = 1):
	if skill_points >= amount:
		skill_points -= amount
		skill_point_used.emit()

@onready var hp_hud: HpHUD = $"../../UI/HpHUD"

var max_hp: float = 100

var damage_mult: float = 1

var damage_taken_mult: float = 1

func reset_skills():
	max_hp = 100
	damage_mult = 1
	damage_taken_mult = 1

func _physics_process(delta):
	reset_skills()
	update_skills.emit()
	post_update_skills.emit()


func _on_enemy_death():
	add_xp(1)


signal level_up

signal skill_point_used

signal update_skills

signal post_update_skills
