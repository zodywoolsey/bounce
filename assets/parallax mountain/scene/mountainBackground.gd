@tool
extends Node3D
@onready var trees = $trees
@onready var small_montains = $smallMontains
@onready var big_mountains = $bigMountains
@onready var sky = $sky

@export_range(0.0,10.0,0.1) var speed :float = 1.0
@export var reverse : bool = false
var reversed : int = -1

func _process(delta):
	reversed = (int(!reverse)*2)-1
	trees.transform.origin.x += speed*reversed*delta
	if trees.transform.origin.x > 5 or trees.transform.origin.x < -5:
		trees.transform.origin.x = 0
	small_montains.transform.origin.x += speed*reversed*delta*.3
	if small_montains.transform.origin.x > 5 or small_montains.transform.origin.x < -5:
		small_montains.transform.origin.x = 0
	big_mountains.transform.origin.x += speed*reversed*delta*.1
	if big_mountains.transform.origin.x > 10 or big_mountains.transform.origin.x < -10:
		big_mountains.transform.origin.x = 0
	sky.transform.origin.x += speed*reversed*delta*.08
	if sky.transform.origin.x > 10 or sky.transform.origin.x < -10:
		sky.transform.origin.x = 0
