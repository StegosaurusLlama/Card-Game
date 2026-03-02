class_name Deck

var size = 0
var contents:Array[int]

func _init(data:Array[int] = []):
	if data.is_empty():
		contents = [1,2,3,4,5]
	else:
		contents = data.duplicate()
	size = contents.size()
		
	
func add(id:int):
	size += 1
	contents.push_back(id)
	
func remove(id:int):
	size -= 1
	contents.erase(id)
