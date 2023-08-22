extends Weapon

@onready var player = $"../.."
@onready var anim_player: AnimationPlayer = $AnimationPlayer
@onready var audio_player: AudioStreamPlayer3D = $Sound

const attack_distance = 1000
const dmg = 60

func get_attack_cooldown():
	return 1

func attack():
	var space_state = get_world_3d().direct_space_state
	
	var origin: Vector3 = get_parent_node_3d().global_position
	var destination: Vector3 = origin - get_parent_node_3d().global_transform.basis.z * attack_distance
	
	var query = PhysicsRayQueryParameters3D.create(origin, destination, player.collision_mask)
	var result = space_state.intersect_ray(query)
	if result and result.collider is Enemy:
		damage(result.collider, dmg)
		print("DAMAGED")
	
	play_fire_animation()
	play_fire_sound()

func play_fire_animation():
	anim_player.stop()
	anim_player.play("FireNoLoad")

func play_fire_sound():
	audio_player.play()
