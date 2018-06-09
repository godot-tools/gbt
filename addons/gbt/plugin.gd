tool

extends EditorPlugin

var dock

func _enter_tree():
	add_custom_type("BehaviorTree", "Node", preload("res://addons/gbt/behavior_tree.gd"), preload("res://addons/gbt/icon.png"))
	dock = preload("res://addons/gbt/VisualBT.tscn").instance()
	add_control_to_bottom_panel(dock, "Behavior Tree")
	
func _exit_tree():
	remove_control_from_bottom_panel(dock)
	dock.free()
