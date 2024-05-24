extends EnemyBase

@onready var model: Node3D = $Eye
@onready var anim_player: AnimationPlayer = $AnimationPlayer

const SPEED: float = 100.0

func _physics_process(delta):
	velocity = Vector3.ZERO
	enemy_ai()
	move(delta)
	move_and_slide()

func enemy_ai():
	if anim_player.is_playing():
		return
	
	var direction: Vector3 = global_position.direction_to(player.global_position)
	model.rotation = Vector3(0, -Vector2(direction.x, direction.z).angle(), direction.y)

	if can_shoot():
		shoot()

func move(delta):
	var direction: Vector3 = global_position.direction_to(get_movement_target())
	velocity = direction * delta * SPEED

func can_see_player():
	var space_state = get_world_3d().direct_space_state
	var query = PhysicsRayQueryParameters3D.create(global_position, player.global_position, 8)
	return !space_state.intersect_ray(query).has("collider")

func can_shoot():
	return global_position.distance_to(player.global_position) < 10 and can_see_player()

func shoot():
	anim_player.play("Shoot")
