"""
Context is a structure used to provide context to nodes in a behavior tree,
giving them references to useful information, such as the blackboard and the 
actor that the BT is acting on.
"""

extends Node

var tree
var actor
var blackboard
var open_nodes = []

func _init(tree, actor, blackboard):
	self.tree = tree
	self.actor = actor
	self.blackboard = blackboard

func _open_node(node):
	open_nodes.push_back(node)
	
func _close_node(node):
	if open_nodes.has(node):
		open_nodes.remove(open_nodes.find(node))