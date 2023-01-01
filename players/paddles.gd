extends Node3D

@export var separation = 8.0
@export var length = 8.0
@export var width = 0.5
@export var power = 0.1

var rightRot = 45
var leftRot = -45

@onready var right_paddle = $rightPaddle
@onready var rp_col = $rightPaddle/rpCol
@onready var rp_mesh = $rightPaddle/rpMesh

@onready var left_paddle = $leftPaddle
@onready var lp_col = $leftPaddle/lpCol
@onready var lp_mesh = $leftPaddle/lpMesh

func _ready():
	right_paddle.position.x = separation
	rp_col.position.x = -((length/2)-(width))
	rp_mesh.position.x = -((length/2)-(width))
	rp_col.shape.height = length
	rp_col.shape.radius = width
	rp_mesh.mesh.height = length
	rp_mesh.mesh.radius = width
	left_paddle.position.x = -separation
	lp_col.position.x = ((length/2)-(width))
	lp_mesh.position.x = ((length/2)-(width))
	lp_col.shape.height = length
	lp_col.shape.radius = width
	lp_mesh.mesh.height = length
	lp_mesh.mesh.radius = width

func _process(delta):
	if Engine.is_editor_hint():
		right_paddle.position.x = separation
		rp_col.position.x = -((length/2)-(width))
		rp_mesh.position.x = -((length/2)-(width))
		rp_col.shape.height = length
		rp_col.shape.radius = width
		rp_mesh.mesh.height = length
		rp_mesh.mesh.radius = width
		left_paddle.position.x = -separation
		lp_col.position.x = ((length/2)-(width))
		lp_mesh.position.x = ((length/2)-(width))
		lp_col.shape.height = length
		lp_col.shape.radius = width
		lp_mesh.mesh.height = length
		lp_mesh.mesh.radius = width
	if Input.is_action_pressed("right") and right_paddle.rotation.z > 0:
			right_paddle.rotation.z = lerp_angle(right_paddle.rotation.z,0,power*Input.get_action_strength("right"))
	else:
		if right_paddle.rotation.z < 45:
			right_paddle.rotation.z = lerp_angle(right_paddle.rotation.z,45,power)
	if Input.is_action_pressed("left") and left_paddle.rotation.z < 0:
			left_paddle.rotation.z = lerp_angle(left_paddle.rotation.z,0,power)
	else:
		if left_paddle.rotation.z > -45:
			left_paddle.rotation.z = lerp_angle(left_paddle.rotation.z,-45,power)
