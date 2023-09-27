extends Area3D

const DMG: float = 10

func _ready():
	body_entered.connect(on_body_entered)

func on_body_entered(body: Node3D):
	if body is Player:
		body.damage(DMG)
