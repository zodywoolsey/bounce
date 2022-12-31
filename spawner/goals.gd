@tool
extends Node3D
@onready var range = $range
@onready var goal = $goal
@onready var goalMeshin = $goal/MeshInstance3D
@onready var goalColsh = $goal/CollisionShape3D


@export var maxSize = 5
@export var minSize = .25
@export var rangex :float = 1.0
@export var rangey :float = 1.0
@export var rangez :float = 1.0

var moveTimer = 0
var readyToMove :bool = true

var spawned = false

func _ready():
	if not Engine.is_editor_hint() and range.visible:
		range.hide()
	if spawned == false:
		moveGoal()
		spawned = true
	goal.body_entered.connect(func(body):
		moveGoal()
		)

func _process(delta):
	if Engine.is_editor_hint():
		if range:
			range.mesh.size = Vector3(rangex,rangey,rangez)
		else:
			range = $range
#		moveGoal()
	if not Engine.is_editor_hint() and range:
		if moveTimer > .05:
			moveTimer = 0
#		if range.visible:
#			range.hide()
#		if spawned == false:
#			moveGoal()
#			spawned = true


func spawnGoal():
	var tmpsize :float = randf_range(minSize,maxSize)
	var goalMesh = MeshInstance3D.new()
	goalMesh.mesh = SphereMesh.new()
	goalMesh.mesh.radius = tmpsize
	var goalCol = CollisionShape3D.new()
	goalCol.shape = SphereShape3D.new()
	goalCol.shape.radius = tmpsize
	var goalArea = Area3D.new()
	goalArea.add_child(goalCol)
	goalArea.add_child(goalMesh)
	goalArea.body_entered.connect(func(body):
		spawnGoal()
		goalArea.queue_free()
		)
	add_child(goalArea)
	var tmpx = randf_range(-rangex+(rangex/2),rangex-(rangex/2))
	var tmpy = randf_range(-rangex+(rangex/2),rangex-(rangex/2))
	var tmpz = 0
	goalArea.position = Vector3(tmpx,tmpy,tmpz)

func moveGoal():
	var tmpsize :float = randf_range(minSize,maxSize)
	goalMeshin.mesh.radius = tmpsize
	goalMeshin.mesh.height = tmpsize*2
	goalColsh.shape.radius = tmpsize
	var tmpx = randf_range(-rangex+(rangex/2),rangex-(rangex/2))
	var tmpy = randf_range(-rangex+(rangex/2),rangex-(rangex/2))
	var tmpz = 0
	goal.position = Vector3(tmpx,tmpy,tmpz)
