tool
extends GraphNode

const DEFAULT_SLOT_TEXT = "<Script File>"
const DEFAULT_TITLE = "Action"

onready var _script_slot = get_node("ScriptFileSlot")

var behave_script

func _ready():
	_script_slot.connect("script_set", self, "_script_set")
	_script_slot.connect("script_removed", self, "_script_removed")

func _script_removed():
	if behave_script:
		behave_script.free()
		behave_script = null
	_script_slot.text = DEFAULT_SLOT_TEXT
	title = DEFAULT_TITLE

func _script_set(script):
	behave_script = script
	title = script.resource_path.get_file()
