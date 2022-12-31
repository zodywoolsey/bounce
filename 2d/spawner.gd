extends Node2D

var level = 1
var ballScene = preload("res://ball.tscn")

func _ready():
	for i in range(level):
		add_child(ballScene.instantiate())

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		add_child(ballScene.instantiate())
