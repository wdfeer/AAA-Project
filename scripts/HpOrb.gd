extends Area3D

const HEAL_AMOUNT: float = 5

@onready var anim_player: AnimationPlayer = $AnimationPlayer

func _ready():
	body_entered.connect(on_body_entered)
	anim_player.play("OrbUpDown")

func on_body_entered(body: Node3D):
	if body is Player:
		body.heal(HEAL_AMOUNT)
		queue_free()
