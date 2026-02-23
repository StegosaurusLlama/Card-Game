extends Node2D

var hitBox
var animator
var draggable = false
var baseScale = scale
var baseTransform = position
var is_dragging = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hitBox = get_node("Area2D")
	animator = get_node("AnimatedSprite2D")
	print("Ready: " + str(global.is_dragging))
	animator.play("default")
	$Area2D/AnimationPlayer.play("new_animation")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if draggable:
		if Input.is_action_pressed("click"):
			global.is_dragging = true
			is_dragging = true
			position = get_global_mouse_position()
		elif Input.is_action_just_released("click"):
			global.is_dragging = false
			is_dragging = false
			baseTransform.x = position.x
			baseTransform.y = position.y
		
		


func _on_area_2d_mouse_entered() -> void:
	print("Entered: " + str(global.is_dragging))
	if not global.is_dragging:
		print("Checked")
		draggable = true
		scale = baseScale * 1.05
		position = Vector2(baseTransform.x, baseTransform.y - 10)
	


func _on_area_2d_mouse_exited() -> void:
	print("Entered: " + str(global.is_dragging))
	if not global.is_dragging:
		print("Checked")
		draggable = false
		scale = baseScale
		position = baseTransform
	
