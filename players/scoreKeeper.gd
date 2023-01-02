extends Node

var scorelbl : Label
var score = 0

func _process(delta):
	if !scorelbl:
		scorelbl = get_tree().get_first_node_in_group('scoreLabel')
	else:
		scorelbl.text = "score: {0}".format([score])
