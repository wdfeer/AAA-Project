extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta


	move_and_slide()

func jump():
	velocity.y = JUMP_VELOCITY
	

var hp: float = 100;
func damage(value: float):
	print_debug("Enemy damaged by " + str(value))
	
	hp -= value
	if hp <= 0:
		queue_free()
