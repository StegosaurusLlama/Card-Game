extends Control
class_name UICard

@onready var label = $Panel/Label
var card_id:int
var selected:bool = false
var drag_offset:Vector2 = Vector2.ZERO
var is_in_hand:bool = false

static var card_scene = preload("res://card.tscn")

static func create(id:int = 0) -> UICard:
	var card = card_scene.instantiate()
	card.card_id = id
	return card

# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = str(card_id)


# Built in godot function. Implementing enables dragability.
func _get_drag_data(at_position): 
	var card_preview = create(card_id)
	var temp = Control.new()
	card_preview.position = -at_position
	drag_offset = at_position
	temp.add_child(card_preview)
	set_drag_preview(temp)
	return self

func _can_drop_data(at_position, data):
	return data is UICard && is_in_hand
	
func _drop_data(at_position, data):
	var card:UICard = data
	card.reparent(get_parent())
	card.is_in_hand = true
	get_parent().move_child(card, get_index())

func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			selected = true
		elif event.button_index == MOUSE_BUTTON_LEFT and !event.pressed:
			selected = false
