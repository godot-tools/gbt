tool
extends GraphEdit

const ITEM_LEAF = 2
const ITEM_SELECTOR = 3
const ITEM_SEQUENCE = 4
const ITEM_INVERTER = 5
const ITEM_REPEATER = 6

const ActionNode = preload("res://addons/gbt/ActionNode.tscn")
const CompositeNode = preload("res://addons/gbt/CompositeNode.tscn")
const DecoratorNode = preload("res://addons/gbt/DecoratorNode.tscn")

const BTRoot = preload("res://addons/gbt/BTRoot.gd")

var _root

func _ready():
	var new_node_btn = get_node("ButtonPane/NewNode")
	new_node_btn.connect("new_node", self, "_new_node")
	connect("connection_request", self, "_connection_request")
	connect("disconnection_request", self, "_disconnect_request")
	
func _new_node(id):
	var node
	if id == ITEM_LEAF:
		node = ActionNode.instance()
	elif id == ITEM_SELECTOR:
		node = CompositeNode.instance()
		node.get_node("Label").text = "Selector"
	elif id == ITEM_SEQUENCE:
		node = CompositeNode.instance()
		node.get_node("Label").text = "Sequence"
	elif id == ITEM_INVERTER:
		node = DecoratorNode.instance()
		node.get_node("Label").text = "Inverter"
	elif id == ITEM_REPEATER:
		node = DecoratorNode.instance()
		node.get_node("Label").text = "Repeater"
	if node:
		node.connect("close_request", self, "_close_request", [node])
		add_child(node)
		
func _connection_request(from, from_slot, to, to_slot):
	connect_node(from, from_slot, to, to_slot)
	
func _disconnect_request(from, from_slot, to, to_slot):
	disconnect_node(from, from_slot, to, to_slot)
	
func _close_request(node):
	_disconnect_node(node)
	remove_child(node)
	node.queue_free()

func _disconnect_node(node):
	var conn_list = get_connection_list()
	for conn in conn_list:
		if conn["from"] == node.name or conn["to"] == node.name:
			disconnect_node(conn["from"], conn["from_port"], conn["to"], conn["to_port"])
			
func can_drop_data(position, data):
	return (
		typeof(data) == TYPE_DICTIONARY and 
		data.has("nodes") and  
		not data["nodes"].empty()
		and typeof(data["nodes"][0]) == TYPE_NODE_PATH
		and _is_btroot(data["nodes"][0])
	)

func drop_data(position, data):
	_load_blackboard(data["nodes"][0])

func _load_blackboard(nodepath):
	var root_node = get_node(nodepath)
	var conn_list = get_connection_list()
	for conn in conn_list:
		print(conn)
			

func _is_btroot(nodepath):
	var node = get_node(nodepath)
	return node is BTRoot
