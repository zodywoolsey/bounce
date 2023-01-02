extends CharacterBody3D

@export var rotateSpeed = 1.0
var rotateVelocity = 0

func _ready():
	pass

func _physics_process(delta):
	if Input.is_action_pressed("right"):
		rotateVelocity += (rotateSpeed*Input.get_action_strength("right"))*delta
	if Input.is_action_pressed("left"):
		rotateVelocity -= (rotateSpeed*Input.get_action_strength("left"))*delta
	rotate(Vector3.FORWARD,rotateVelocity)
#	if !Input.is_action_pressed("ui_right") and !Input.is_action_pressed("ui_left"):
#		rotateVelocity *= .95
	rotateVelocity *= .95
