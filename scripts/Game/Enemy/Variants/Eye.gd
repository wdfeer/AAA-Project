extends EnemyBase

@onready var model: Node3D = $Eye
@onready var anim_player: AnimationPlayer = $AnimationPlayer

const SPEED: float = 100.0

func _physics_process(delta):
	velocity = Vector3.ZERO
	enemy_ai(delta)
	move_and_slide()

func enemy_ai(delta):
	if anim_player.is_playing():
		return
	
	var direction: Vector3 = global_position.direction_to(player.global_position)
	if global_position.distance_to(player.global_position) > 10:
		velocity = direction * delta * SPEED
	else:
		anim_player.play("Shoot")
	model.rotation = Vector3(0, -Vector2(direction.x, direction.z).angle(), direction.y)
