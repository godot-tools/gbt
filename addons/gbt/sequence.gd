extends Node

const State = preload("res://addons/gbt/state.gd")

func _execute(actor):
	var result = State.OK
	
	for child in get_children():
		result = child._execute(actor)
		if result != State.OK:
			break
	
	return result
	