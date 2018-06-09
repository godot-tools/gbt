tool
extends Label

const BTNode = preload("res://addons/gbt/btnode.gd")

signal script_set
signal script_removed

onready var _popup_menu = get_node("PopupMenu")

func _ready():
	connect("gui_input", self, "_on_gui_event")
	connect("mouse_entered", self, "_on_mouse_enter")
	connect("mouse_exited", self, "_on_mouse_exit")
	_popup_menu.connect("id_pressed", self, "_popup_id_pressed")

func can_drop_data(position, data):
	return (
		typeof(data) == TYPE_DICTIONARY and 
		data.has("files") and  
		typeof(data["files"]) == TYPE_STRING_ARRAY and
		data["files"].size() > 0 and
		_is_btnode(data["files"][0])
	)
	
func drop_data(position, data):
	var script = load(data["files"][0])
	text = script.resource_path
	_set_border(0)
	emit_signal("script_set", script)

func _on_gui_event(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_RIGHT and event.pressed:
		var pos = get_global_mouse_position()
		_popup_menu.popup(Rect2(pos, Vector2(20, 20)))

func _popup_id_pressed(id):
	if id == _popup_menu.POPUP_ID_CLEAR:
		emit_signal("script_removed")
		
func _is_btnode(script):
	# This is hacky as all hell, but it's the only way 
	# I could think to do it other than parsing the script 
	# contents which could be very expensive.
	var obj = load(script)
	if not obj.has_method("new"):
		return false
	var ins = obj.new()
	var is_bt =  ins is BTNode
	ins.free()
	return is_bt
	
func _on_mouse_enter():
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		_set_border(2)
		
func _on_mouse_exit():
	_set_border(0)
	
func _set_border(size):
	get_stylebox("normal").set_border_width_all(size)
	update()