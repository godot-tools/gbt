tool
extends PopupMenu

func _enter_tree():
	clear()
	add_submenu_item("Composit", "CompositeSubMenu", 0)
	add_submenu_item("Decorator", "DecoratorSubMenu", 1)
	add_item("Leaf", 2)

