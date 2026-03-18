class_name Hand

@export var max_hand_size:int = 5

var size = 0
var cards:Array[int]

func add_card(id:int)->bool:
	if size >= max_hand_size:
		return false
	cards.push_back(id)
	size += 1
	return true
		
func remove_card(pos:int):
	if pos >= size:
		push_error("%d is out of bounds for hand" % pos)
	cards.remove_at(pos)

# currently unused
func swap_pos(pos_a:int, pos_b:int):
	if pos_a >= size:
		push_error("%d is out of bounds for hand" % pos_a)
	if pos_b >= size:
		push_error("%d is out of bounds for hand" % pos_b)
	pos_a ^= pos_b
	pos_b ^= pos_a
	pos_a ^= pos_b
	
