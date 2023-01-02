extends Node2D

var rTouch : Array = Array()
var lTouch : Array = Array()

func _process(delta):
	if rTouch.size() > 0 and !Input.is_action_pressed("right"):
		Input.action_press("right")
	if lTouch.size() > 0 and !Input.is_action_pressed("left"):
		Input.action_press("left")

func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			if event.position.x > get_viewport_rect().size.x/2:
				if !rTouch.has(event.index):
					rTouch.push_back(event.index)
					if lTouch.has(event.index):
						lTouch.remove_at(lTouch.find(event.index))
			if event.position.x < get_viewport_rect().size.x/2:
				if !lTouch.has(event.index):
					lTouch.push_back(event.index)
					if rTouch.has(event.index):
						rTouch.remove_at(lTouch.find(event.index))
		if !event.pressed:
			if rTouch.has(event.index):
				rTouch.remove_at( rTouch.find(event.index) )
			if rTouch.size() < 1:
				Input.action_release("right")
				
			if lTouch.has(event.index):
				lTouch.remove_at( lTouch.find(event.index) )
			if lTouch.size() < 1:
				Input.action_release("left")
		
