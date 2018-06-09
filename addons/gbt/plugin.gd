tool

extends EditorPlugin

var dock

func _enter_tree():
	add_custom_type("Blackboard", "Node", preload("res://addons/gbt/blackboard.gd"), preload("res://addons/gbt/icons/blackboard.png"))
	add_custom_type("BehaviorTree", "Node", preload("res://addons/gbt/behavior_tree.gd"), preload("res://addons/gbt/icons/tree.png"))
	add_custom_type("Selector", "Node", preload("res://addons/gbt/selector.gd"), preload("res://addons/gbt/icons/selector.png"))
	add_custom_type("Sequence", "Node", preload("res://addons/gbt/sequence.gd"), preload("res://addons/gbt/icons/sequence.png"))
	add_custom_type("Inverter", "Node", preload("res://addons/gbt/inverter.gd"), preload("res://addons/gbt/icons/inverter.png"))
	add_custom_type("Repeater", "Node", preload("res://addons/gbt/repeater.gd"), preload("res://addons/gbt/icons/repeater.png"))
	add_custom_type("Succeeder", "Node", preload("res://addons/gbt/succeeder.gd"), preload("res://addons/gbt/icons/succeeder.png"))
	
func _exit_tree():
	remove_custom_type("Blackboard")
	remove_custom_type("BehaviorTree")
	remove_custom_type("Selector")
	remove_custom_type("Sequence")
	remove_custom_type("Inverter")
	remove_custom_type("Repeater")
	remove_custom_type("Succeeder")
