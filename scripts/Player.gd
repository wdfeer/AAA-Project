class_name Player
extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var camera = $PlayerCamera

func _physics_process(delta):
	if global_position.y < -3:
		die()
		return
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var input_dir = Input.get_vector("left", "right", "up", "down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized().rotated(Vector3.UP, camera.rotation.y)
	if direction and is_on_floor():
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	elif is_on_floor():
		velocity.x = move_toward(velocity.x, 0, SPEED / 5)
		velocity.z = move_toward(velocity.z, 0, SPEED / 5)
	
	move_and_slide()


@onready var hp_hud: HpHUD = $"../UI/HpHUD"

var hp: float = 100;

func damage(value: float):
	hp -= value
	hp_hud.set_hp(int(hp))
	if hp <= 0:
		die()

func die():
	get_tree().change_scene_to_file("res://game.tscn")	
