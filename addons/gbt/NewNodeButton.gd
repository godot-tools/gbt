tool
extends Button

onready var _popup_menu = get_node("NewNodePopup")

signal new_node

func _ready():
	_connect_popup()
	connect("pressed", self, "_pressed")
	
func _connect_popup():
	_popup_menu.connect("id_pressed", self, "_item_clicked")
	for child in _popup_menu.get_children():
		if child is PopupMenu:
			child.connect("id_pressed", self, "_item_clicked")

func _item_clicked(id):
	emit_signal("new_node", id)

func _pressed():
	var bounds = Rect2(get_global_mouse_position(), Vector2(20, 20))
	_popup_menu.popup(bounds)
	
	
