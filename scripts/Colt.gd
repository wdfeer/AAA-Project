extends Weapon

@onready var effect_player: AnimationPlayer = $EffectPlayer
@onready var anim_player: AnimationPlayer = $AnimationPlayer
@onready var audio_player: AudioStreamPlayer3D = $Sound

const ATTACK_DISTANCE = 1000
const DMG = 40

func get_attack_cooldown():
	return 1

func attack():
	var space_state = get_world_3d().direct_space_state
	
	var origin: Vector3 = get_parent_node_3d().global_position
	var destination: Vector3 = origin - get_parent_node_3d().global_transform.basis.z * ATTACK_DISTANCE
	
	var query = PhysicsRayQueryParameters3D.create(origin, destination, player.collision_mask)
	var result = space_state.intersect_ray(query)
	if result and result.collider is EnemyBase:
		damage(result.collider, DMG)
	
	effect_player.play("ShootEffects")
