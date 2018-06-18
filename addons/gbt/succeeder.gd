"""
Succeeder is a Decorator node that always returns State.OK if 
its child doesn't return State.RUNNING or an Error.
"""

extends "res://addons/gbt/btnode.gd"

const Error = preload("res://addons/gbt/error.gd")

func tick(ctx):
	if get_child_count() != 1:
		return Error.new(self, str("[ERR]: Succeeder must have exactly one child. ", name, " has ", get_child_count(), "."))

	var result = get_child(0)._execute(ctx)
	if (typeof(result) == TYPE_OBJECT and result is Error) or result == ERR_BUSY:
		return result
	
	return OK
