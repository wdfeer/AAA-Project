class_name EnemySpawner
extends Node3D

@export var enemy_scenes: Array

@onready var rng: RandomNumberGenerator = RandomNumberGenerator.new()

var spawnpoints: PackedVector3Array

var current_wave: int = 0
var enemies_to_spawn: int = 0

func get_spawn_cooldown():
	return 2 / pow(current_wave, 0.6)
var spawn_timer: float = 1

func _ready():
	var children = get_children()
	spawnpoints = children.map(func(node3d: Node3D): return node3d.global_position)
	
	for node in children:
		node.queue_free()


func _unhandled_input(event):
	if enemies_to_spawn == 0 and event.is_action_pressed("next_wave"):
		new_wave()

func _process(delta):
	if enemies_to_spawn > 0:
		spawn_timer -= delta
		if spawn_timer <= 0:
			spawn_enemy()
			spawn_timer = get_spawn_cooldown()
			enemies_to_spawn -= 1

func new_wave():
	current_wave += 1
	enemies_to_spawn = get_enemy_count(current_wave)

func get_enemy_count(wave: int):
	return 1 + int((wave - 1) / 3.0)

func spawn_enemy():
	var enemy: EnemyBase = enemy_scenes.pick_random().instantiate()
	add_child(enemy)
	
	var position = spawnpoints[rng.randi_range(0, len(spawnpoints) - 1)]
	enemy.global_position = position

signal enemy_died
