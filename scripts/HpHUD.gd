class_name HpHUD
extends Control

@onready var hp_bar: TextureProgressBar = $HpBar
@onready var hp_label: Label = $HpLabel

func set_hp(value: int):
	hp_bar.value = value
	hp_label.text = str(value)
