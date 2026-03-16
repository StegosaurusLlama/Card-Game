extends Control

signal dropped_here(data:Node2D)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Built in godot funtion. Implementing lets the program know what can be dragged here / where dragging is valid,
func _can_drop_data(at_position, data):
	return true
	
# Built in godot function. Implementing allows recieving dropped data.
func _drop_data(at_position, data):
	print(data)
	dropped_here.emit(data)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
