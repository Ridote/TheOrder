extends "res://Entities/Character/Character.gd"

var direction : Vector2 = Vector2(0,0)

func _physics_process(delta):
	input()
	
	move(delta, direction, get_global_mouse_position())
	animate()
	
func input():
	if(Input.is_action_pressed("ui_down")):
		direction.y = 1
	elif(Input.is_action_pressed("ui_up")):
		direction.y = -1
	else:
		direction.y = 0
	if(Input.is_action_pressed("ui_right")):
		direction.x = 1
	elif(Input.is_action_pressed("ui_left")):
		direction.x = -1
	else:
		direction.x = 0