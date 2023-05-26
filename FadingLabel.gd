class_name FadingLabel
extends Label

const FADING_SPEED: float = 0.5

func show_text(text: String):
	modulate.a = 1
	self.text = text

func _process(delta):
	if modulate.a > 0:
		modulate.a -= delta * FADING_SPEED
