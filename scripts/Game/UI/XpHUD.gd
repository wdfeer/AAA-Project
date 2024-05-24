class_name XpHUD
extends Control

@onready var bar: TextureProgressBar = $XpBar
@onready var label: Label = $XpLabel

func set_display(ratio: float, lvl: int):
	bar.value = ratio
	label.text = str(lvl)
