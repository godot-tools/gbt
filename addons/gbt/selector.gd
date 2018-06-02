"""
Selector is a Composite node that ticks children until one returns 
State.OK, State.RUNNING, or an Error. This node only fails when 
ALL children return State.FAILED.
"""

extends "res://addons/gbt/btnode.gd"

func tick(ctx):
	var result = State.OK

	for child in get_children():
		result = child._execute(ctx)	
		if result != State.FAILED:
			break

	return result