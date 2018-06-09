tool
extends Label

const DEFAULT_ACTOR_NAME = "<Actor>"
const WHITE = Color(1.0, 1.0, 1.0)


var actor setget set_actor

onready var _popup_menu = get_node("PopupMenu")
onready var _graph_node = get_parent()

func _ready():
	text = DEFAULT_ACTOR_NAME
	connect("gui_input", self, "_on_gui_event")
	_popup_menu.connect("id_pressed", self, "_popup_item_pressed")

func can_drop_data(position, data):
	print("can_drop")
	return (
		typeof(data) == TYPE_DICTIONARY and 
		data.has("nodes") and  
		not data["nodes"].empty()
		and typeof(data["nodes"][0]) == TYPE_NODE_PATH
	)
	
func drop_data(position, data):
	print("drop")
	actor = set_actor(get_node(data["nodes"][0]))
	
	
func _on_gui_event(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_RIGHT and event.pressed:
		var pos = get_global_mouse_position()
		get_node("PopupMenu").popup(Rect2(pos, Vector2(20, 20)))
		
func _popup_item_pressed(id):
	if id == _popup_menu.POPUP_ID_CLEAR:
		set_actor(null)
		
func set_actor(a):
	actor = a
	text = actor.name if actor else DEFAULT_ACTOR_NAME
	if actor:
		_graph_node.set_slot(0, false, 0, WHITE, true, 0, WHITE)
	else:
		_graph_node.clear_slot(0)
		
		
		