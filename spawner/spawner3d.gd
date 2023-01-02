extends Node3D

var ball = preload("res://ball3d.tscn")
var ballCount = 0

func _ready():
	addBall()

func _physics_process(delta):
	var menu : Control = get_tree().get_first_node_in_group('menu')
	if ballCount < 1 and !menu.visible:
		menu.gameOver()

func addBall():
	ballCount += 1
	add_child(ball.instantiate())

func removeBall(ballToRemove):
	ballCount -= 1
	ballToRemove.queue_free()
