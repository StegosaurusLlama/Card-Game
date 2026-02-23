class_name DrawPile

var cards:Array[int]

func _init(test):
	pass
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func shuffle():
	cards.shuffle()
	
func draw()->int:
	return cards.pop_back()
	
func is_empty()->bool:
	return cards.size() > 0

func add_card(card_id, do_shuffle:bool = true):
	if typeof(card_id) == TYPE_INT:
		cards.push_back(card_id)
	elif typeof(card_id) == TYPE_ARRAY:
		cards.append_array(card_id)
	if (do_shuffle):
		self.shuffle()
