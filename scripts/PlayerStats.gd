class_name PlayerStats
extends Node

@onready var XpHUD: XpHUD = $"../../UI/XpHUD"

func _ready():
	$"../../EnemySpawner".connect("enemy_died", on_enemy_death)


var damage_mult: float = 1

var damage_taken_mult: float = 1


var xp_progress: int = 0
var lvl: int = 0

func update_lvl():
	var required = get_xp_for_lvl(lvl + 1)
	while (xp_progress >= required):
		xp_progress -= required
		lvl += 1
		required = get_xp_for_lvl(lvl + 1)

func get_xp_for_lvl(lvl: int):
	return int(pow(1.5, lvl) + 6)

func update_xp_display():
	update_lvl()
	XpHUD.set_display(xp_progress / float(get_xp_for_lvl(lvl + 1)), lvl)

func add_xp(amount: int):
	xp_progress += amount
	update_xp_display()


func on_enemy_death():
	add_xp(1)
