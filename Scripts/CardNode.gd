extends Control
class_name UICard

@onready var card_name = $Panel/VBoxContainer/Name
@onready var card_desc = $Panel/VBoxContainer/Decription
@onready var card_art = $"Panel/VBoxContainer/Card Art"

var card_id:int
var card_dict:Dictionary
var selected:bool = false
var drag_offset:Vector2 = Vector2.ZERO
var is_in_hand:bool = false

static var card_scene = preload("res://Prefabs/card.tscn")

static func create(id:int = 0) -> UICard:
	var card = card_scene.instantiate()
	card.card_id = id
	var card_json_file: FileAccess = FileAccess.open("res://Options/card.json", FileAccess.READ);
	card.card_dict = JSON.parse_string(card_json_file.get_as_text())[str(id)]
	return card

# Called when the node enters the scene tree for the first time.
func _ready():
	card_name.text = card_dict["name"]
	card_desc.text = card_dict["flavor"]
	card_art.texture = ImageTexture.create_from_image(Image.load_from_file("res://Sprites/Cards/" + card_dict["name"] + ".png"))


# Built in godot function. Implementing enables dragability.
func _get_drag_data(at_position): 
	var card_preview = create(card_id)
	var temp = Control.new()
	card_preview.position = -at_position
	drag_offset = at_position
	temp.add_child(card_preview)
	visible = false
	set_drag_preview(temp)
	return self

func _can_drop_data(_at_position, data):
	return data is UICard && is_in_hand
	
func _drop_data(_at_position, data):
	var card:UICard = data
	card.drop_onto(get_parent())
	card.is_in_hand = true
	get_parent().move_child(card, get_index())

func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			selected = true
		elif event.button_index == MOUSE_BUTTON_LEFT and !event.pressed:
			selected = false

func drop_onto(parent:Node):
	visible = true
	get_parent().remove_child(self)
	parent.add_child(self)
