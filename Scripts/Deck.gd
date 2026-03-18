class_name Deck

var size = 0
var contents:Array[String]

func _init(data:Array[String] = []):
	if data.is_empty():
		contents = ["","","","",""]
	else:
		contents = data.duplicate()
	size = contents.size()
		
	
func add(id:String):
	size += 1
	contents.push_back(id)
	
func remove(id:String):
	size -= 1
	contents.erase(id)
