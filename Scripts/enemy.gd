extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Built in godot funtion. Implementing lets the program know what can be dragged here / where dragging is valid,
func _can_drop_data(at_position, data):
	return data is UICard
	
# Built in godot function. Implementing allows recieving dropped data.
func _drop_data(at_position, data): # data is UICard
	var card:UICard = data
	card.is_in_hand = false
	card.drop_onto(self)
	card.position = at_position - card.drag_offset
	print(card.card_id)
