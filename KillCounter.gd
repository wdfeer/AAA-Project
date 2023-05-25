class_name KillCounter
extends Label

var count: int = 0

func add(value: int = 1):
	count += value
	update_text()

func update_text():
	text = str(count)
