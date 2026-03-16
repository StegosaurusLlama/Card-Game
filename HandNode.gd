extends Control

@onready var slots = $ScrollContainer/Slots
# Called when the node enters the scene tree for the first time.
func _ready():
	for id in Master.deck.contents:
		add_card(id)# Replace with function body.

# Built in godot funtion. Implementing lets the program know what can be dragged here / where dragging is valid,
func _can_drop_data(at_position, data):
	return data is UICard
	
# Built in godot function. Implementing allows recieving dropped data.
func _drop_data(at_position, data): # data is UICard
	var card:UICard = data
	card.is_in_hand = true
	card.drop_onto(slots)
	print(card.card_id)

func add_card(id:int):
	Master.hand.add_card(id)
	var card = UICard.create(id)
	card.is_in_hand = true
	slots.add_child(card)

func remove_card(pos:int):
	Master.hand.remove_card(pos)
	
func swap_cards():
	pass
