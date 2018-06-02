"""
Inverter is a Decorator node that returns the netgation of its child's result.
"""

extends "res://addons/gbt/btnode.gd"

func tick(ctx):
	if get_child_count() != 1:
		return Error.new(self, str("[ERR]: Inverter must have exactly one child. ", name, " has ", get_child_count(), "."))

	var result = get_child(0)._execute(ctx)
	
	if result is Error or result == State.RUNNING:
		return result
	
	if result == State.OK:
		return State.FAILED
	
	if result == State.FAILED:
		return State.OK
		
	return Error.new(self, str("Invalid state: ", result))
