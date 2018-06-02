extends Node

const Error = preload("res://addons/gbt/error.gd")
const State = preload("res://addons/gbt/state.gd")

func _execute(actor):
	var action = get_child(0)
	
	while true:
		var result = action._execute(actor)
		
		if result is Error or result == State.RUNNING:
			return result
	
	return State.OK	