tool

extends EditorPlugin

func _enter_tree():
	add_custom_type("BTNode", "Node", preload("res://addons/gbt/btnode.gd"), preload("res://addons/gbt/icon.png"))
	add_custom_type("Repeater", "Node", preload("res://addons/gbt/repeater.gd"), preload("res://addons/gbt/icon.png"))
	add_custom_type("Inverter", "Node", preload("res://addons/gbt/inverter.gd"), preload("res://addons/gbt/icon.png"))
	add_custom_type("Sequence", "Node", preload("res://addons/gbt/sequence.gd"), preload("res://addons/gbt/icon.png"))
	add_custom_type("Selector", "Node", preload("res://addons/gbt/selector.gd"), preload("res://addons/gbt/icon.png"))
	add_custom_type("BehaviorTree", "Node", preload("res://addons/gbt/behavior_tree.gd"), preload("res://addons/gbt/icon.png"))
	
func _exit_tree():
	remove_custom_type("BTNode")
	remove_custom_type("Repeater")
	remove_custom_type("Inverter")
	remove_custom_type("Sequence")
	remove_custom_type("Selector")
	remove_custom_type("BehaviorTree")
