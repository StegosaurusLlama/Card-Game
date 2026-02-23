extends Control

@onready var label = $Panel/Label
var card_id:int
var selected:bool = false

func _init(id:int = 0):
	card_id = id

# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = str(card_id)


# Built in godot function. Implementing enables dragability.
func _get_drag_data(at_position): 
	return card_id

func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			selected = true
		elif event.button_index == MOUSE_BUTTON_LEFT and !event.pressed:
			selected = false
