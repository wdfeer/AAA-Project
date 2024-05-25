class_name FadingLabel
extends Label

const FADING_SPEED: float = 0.5

func show_text(str: String):
	modulate.a = 1
	text = str

func _process(delta):
	if modulate.a > 0:
		modulate.a -= delta * FADING_SPEED
