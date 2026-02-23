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

func swap_pos(pos_a:int, pos_b:int):
	if pos_a >= size:
		push_error("%d is out of bounds for hand" % pos_a)
	if pos_b >= size:
		push_error("%d is out of bounds for hand" % pos_b)
	pos_a ^= pos_b
	pos_b ^= pos_a
	pos_a ^= pos_b
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
