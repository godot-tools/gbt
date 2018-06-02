extends Node

const Error = preload("res://addons/gbt/error.gd")
const State = preload("res://addons/gbt/state.gd")

func _execute(actor):
	var action = get_child(0)
	var result = action._execute(actor)
	
	if result is Error or result == State.RUNNING:
		return result
	
	if result == State.OK:
		return State.FAILED
	
	if result == State.FAILED:
		return State.OK
		
	return Error.new(self, "Invalid state.")
