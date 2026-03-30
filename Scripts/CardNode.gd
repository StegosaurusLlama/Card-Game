extends Control
class_name UICard

@onready var card_name_node = $Panel/VBoxContainer/Name
@onready var card_desc = $Panel/VBoxContainer/Decription
@onready var card_art = $"Panel/VBoxContainer/Card Art"

var is_dragging:bool = false
var id:String
var card_dict:Dictionary
var selected:bool = false
var drag_offset:Vector2 = Vector2.ZERO
var is_in_hand:bool = false

static var card_scene = preload("res://Prefabs/card.tscn")
static var a_card_lift:AudioStreamMP3 = preload("res://Audio/SFX/Lift_cut.mp3")

static func create(card_id:String = "") -> UICard:
	var card:UICard = card_scene.instantiate()
	card.id = card_id
	var card_json_file: FileAccess = FileAccess.open("res://Options/card.json", FileAccess.READ);
	card.card_dict = JSON.parse_string(card_json_file.get_as_text())[card_id]
	return card

# Called when the node enters the scene tree for the first time.
func _ready():
	card_name_node.text = card_dict["name"]
	card_desc.text = card_dict["desc"]
	card_art.texture = load(card_dict["img"])


func _notification(what):
	if what == NOTIFICATION_DRAG_END:
		if is_dragging:
			is_dragging = false
			visible = true

# Built in godot function. Implementing enables dragability.
func _get_drag_data(at_position): 
	var card_preview = create(id)
	var temp = Control.new()
	card_preview.position = -at_position
	card_preview.modulate = Color(1,1,1,0.5)
	drag_offset = at_position
	temp.add_child(card_preview)
	is_dragging = true
	visible = false
	AudioManager.play(a_card_lift, 0.7 + AudioManager.rand_a.randf_range(-0.05, 0.05))
	
	set_drag_preview(temp)
	return self

func _can_drop_data(_at_position, data):
	return data is UICard && is_in_hand
	
func _drop_data(_at_position, data):
	var card:UICard = data
	print("TEST", get_parent())
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
	AudioManager.play(a_card_lift, 0.6 + AudioManager.rand_a.randf_range(-0.05, 0.05))
	get_parent().remove_child(self)
	parent.add_child(self)
