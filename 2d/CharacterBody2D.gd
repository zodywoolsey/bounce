extends RigidBody2D

@export var rotateSpeed = 1
var rotateVelocity = 0

func _ready():
	pass

func _physics_process(delta):
	linear_velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		rotateVelocity += rotateSpeed*delta
	if Input.is_action_pressed("ui_left"):
		rotateVelocity -= rotateSpeed*delta
	angular_velocity = rotateVelocity
	if !Input.is_action_pressed("ui_right") and !Input.is_action_pressed("ui_left"):
		rotateVelocity *= .99
