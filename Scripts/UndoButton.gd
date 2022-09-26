extends Node2D



func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.pressed:
			get_tree().call_group("pieces", "reset_pos")
			get_tree().call_group("jigsawHolder", "reset_holder")
