"""
Repeater is a Decorator node that repeats its child until 
it returns either an Error or State.RUNNING.
"""

extends "res://addons/gbt/btnode.gd"

func tick(ctx):
	if get_child_count() != 1:
		return Error.new(self, str("Repeater must have exactly one child. ", name, " has ", get_child_count(), "."))

	var action = get_child(0)
	var result = State.RUNNING	
	while (not result is Error) and result != State.RUNNING:
		result = action._execute(ctx)
	
	return result