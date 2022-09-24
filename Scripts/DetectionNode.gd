extends Node2D

var pressed = false
var active = true
var correct = false

func _process(_delta):
	
	pressed = false
	if Input.is_action_pressed("mouse_left"):
		pressed = true

func _on_Area2D_mouse_entered():
	if pressed:
		active = false
		$Polygon2D.visible = active

func reset_active():
	active = true
	$Polygon2D.visible = active

