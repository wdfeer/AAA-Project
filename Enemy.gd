class_name Enemy
extends CharacterBody3D
	

const SPEED = 3.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var player: CharacterBody3D = $"../../Player"
@onready var kill_counter: KillCounter = $"../../UI/KillCounter"

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

func jump():
	velocity.y = JUMP_VELOCITY


var hp: float = 100;
func damage(value: float):
	print_debug("Enemy damaged by " + str(value))
	
	hp -= value
	if hp <= 0:
		die()

func die():
	queue_free()
	
	kill_counter.add()
