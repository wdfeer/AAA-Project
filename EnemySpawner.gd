extends Node3D

@export var enemy_scene: PackedScene

@onready var rng: RandomNumberGenerator = RandomNumberGenerator.new()

var spawnpoints: PackedVector3Array

const SPAWN_COOLDOWN: float = 4 
var spawn_timer: float = SPAWN_COOLDOWN

func _ready():
	var children = get_children()
	spawnpoints = children.map(func(node3d: Node3D): return node3d.global_position)
	
	for node in children:
		node.queue_free()


func _process(delta):
	spawn_timer -= delta
	if spawn_timer <= 0:
		spawn_enemy()
		spawn_timer = SPAWN_COOLDOWN

func spawn_enemy():
	var enemy = enemy_scene.instantiate() as Enemy
	enemy.global_position = spawnpoints[rng.randi_range(0, len(spawnpoints) - 1)]
	add_child(enemy)
