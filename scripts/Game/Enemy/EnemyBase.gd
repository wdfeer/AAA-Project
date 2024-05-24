class_name EnemyBase
extends CharacterBody3D

@onready var spawner: EnemySpawner = $".."
@onready var player: CharacterBody3D = $"../../Player"

@onready var hp_label: Label3D = $HpLabel
var hp: float = 100

func damage(value: float):
	hp -= value
	hp_label.text = str(hp)
	if hp <= 0:
		die()

const HP_DROP_CHANCE: float = 0.4
@export var hp_orb_scene: PackedScene

func die():
	queue_free()
	
	if randf() < HP_DROP_CHANCE:
		var hp_orb: Node3D = hp_orb_scene.instantiate()
		spawner.add_child(hp_orb)
		hp_orb.global_position = global_position
	
	spawner.enemy_died.emit()

func get_movement_target():
	return $NavigationAgent3D.get_next_path_position()
