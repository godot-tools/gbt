extends Node

const State = preload("res://addons/gbt/state.gd")

func _execute(actor):
	var result = State.FAILED
	for child in get_children():
		result = child._execute(actor)
	return result
	
	