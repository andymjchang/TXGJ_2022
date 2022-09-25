extends Node2D

var pressed = false
var active = true
var correct = false

func _ready():
	$Sprite.frame = (randi() % 3)

func _process(_delta):
	
	pressed = false
	if Input.is_action_pressed("mouse_left"):
		pressed = true

func _on_Area2D_mouse_entered():
	if pressed:
		active = false
		$Sprite.visible = active

func reset_active():
	active = true
	$Sprite.visible = active

func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			active = false
			$Sprite.visible = active


func _on_Area2D_area_entered(area):
	if area.is_in_group("bird"):
		$Sprite.visible = false
