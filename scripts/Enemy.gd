class_name Enemy
extends CharacterBody3D


const SPEED = 3.0
const JUMP_VELOCITY = 4.5

const SWORD_ROTATION_SPEED = 3.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var spawner: EnemySpawner = $".."
@onready var player: CharacterBody3D = $"../../Player"
@onready var sword: Node3D = $Sword
@onready var anim_player: AnimationPlayer = $Shiteyanyo/AnimationPlayer

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
		
	enemy_ai(delta)
	
	move_and_slide()

func enemy_ai(delta):	
	var velocity: Vector3 = global_position.direction_to(player.global_position).normalized() * SPEED
	
	self.velocity.x = velocity.x
	self.velocity.z = velocity.z
	
	rotation.y = -Vector2(velocity.x, velocity.z).angle()
	
	if velocity.length() > 0:
		anim_player.play("Walk", -1, 2)
	
	sword.rotate_y(SWORD_ROTATION_SPEED * delta)

func jump():
	velocity.y = JUMP_VELOCITY


var hp: float = 100;
func damage(value: float):
	hp -= value
	if hp <= 0:
		die()

func die():
	queue_free()
	
	spawner.enemy_died.emit()
