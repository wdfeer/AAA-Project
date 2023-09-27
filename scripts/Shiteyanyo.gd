class_name Shiteyanyo
extends EnemyBase


const SPEED = 3.0
const JUMP_VELOCITY = 4.5

const SWORD_ROTATION_SPEED = 3.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var sword: Node3D = $Shiteyanyo/Sword
@onready var sword_animation: AnimationPlayer = $Shiteyanyo/SwordAnimation
@onready var anim_player: AnimationPlayer = $Shiteyanyo/AnimationPlayer

func _ready():
	sword_animation.play("Sword Rotate")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
		
	enemy_ai(delta)
	
	move_and_slide()

func enemy_ai(delta):
	var velocity: Vector3 = global_position.direction_to(player.global_position) * SPEED
	
	self.velocity.x = velocity.x
	self.velocity.z = velocity.z
	
	rotation.y = -Vector2(velocity.x, velocity.z).angle()
	
	if velocity.length() > 0:
		anim_player.play("Walk", -1, 2)

func jump():
	velocity.y = JUMP_VELOCITY
