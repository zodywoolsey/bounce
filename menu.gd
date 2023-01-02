extends Control

var gameParent : Node3D
var goalMode = preload("res://goalMode.tscn")
@onready var color_rect = $ColorRect

#paddle vars
var paddles = preload("res://players/paddles.tscn")
@onready var paddlesbtn = $main/VBoxContainer/paddlesbtn

#spinner vars
var spinner = preload("res://players/spinner.tscn")
@onready var spinnerbtn = $main/VBoxContainer/spinnerbtn

func _ready():
	gameParent = get_tree().get_first_node_in_group('gameParent')
	paddlesbtn.grab_focus()
	#paddles
	paddlesbtn.pressed.connect(func():
		for c in gameParent.get_children():
			gameParent.remove_child(c)
		gameParent.add_child(goalMode.instantiate())
		var tmp = paddles.instantiate()
		tmp.position = Vector3(0,-9.5,0)
		tmp.length = 9.0
		gameParent.add_child(tmp)
		color_rect.alpha = 0.0
		hide()
		)
	
	#spinner
	spinnerbtn.pressed.connect(func():
		for c in gameParent.get_children():
			gameParent.remove_child(c)
		gameParent.add_child(goalMode.instantiate())
		var tmp = spinner.instantiate()
		gameParent.add_child(tmp)
		color_rect.alpha = 0.0
		hide()
		)

func gameOver():
	show()
	paddlesbtn.grab_focus()
	color_rect.alpha = 1.0
