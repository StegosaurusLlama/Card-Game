extends Control

var hand:Hand
@onready var card_scene = preload("res://card.tscn")

@onready var slots = $ScrollContainer/Slots

func _init(h:Hand = null):
	if h:
		hand = h
	else:
		hand = Hand.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#add_child(card_scene.instantiate(13))# Replace with function body.

# Built in godot funtion. Implementing lets the program know what can be dragged here / where dragging is valid,
func _can_drop_data(at_position, data):
	return true
	
# Built in godot function. Implementing allows recieving dropped data.
func _drop_data(at_position, data):
	print(data)

func add_card(id:int):
	hand.add_card(id)
	var card = card_scene.instantiate()
	slots.add_child(card)

func remove_card(pos:int):
	hand.remove_card(pos)
	
func swap_cards():
	pass
