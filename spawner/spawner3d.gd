extends Node3D

var ball = preload("res://ball3d.tscn")

func _ready():
	add_child(ball.instantiate())

func _physics_process(delta):
	if Input.is_action_pressed("ui_accept"):
		add_child(ball.instantiate())
