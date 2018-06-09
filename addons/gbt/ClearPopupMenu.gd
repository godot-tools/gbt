tool
extends PopupMenu

const POPUP_ID_CLEAR = 0

func _enter_tree():
	clear()
	add_item("Clear", POPUP_ID_CLEAR)
