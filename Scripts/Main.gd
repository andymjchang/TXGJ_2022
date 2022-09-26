extends Node2D

onready var detectionScene = preload("res://Scenes/DetectionNode.tscn")

export var defaultXOffset = 115
export var defaultYOffset = 10

signal startAnim


func _on_CheckButton_verify():
	var holderArray = $Placeholders.get_children()
	var count = 0
	
	for i in holderArray:
		
		if i.correctIndex == i.currentIndex:
			count += 1
	
	if count == 16:
		# all the pieces are in the right place
		get_tree().call_group("pieces", "end_level")
		emit_signal("startAnim")
	else:
		get_tree().call_group("pieces", "reset_pos")
		get_tree().call_group("jigsawHolder", "reset_holder")

