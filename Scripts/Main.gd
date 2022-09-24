extends Node2D

onready var detectionScene = preload("res://Scenes/DetectionNode.tscn")

func _ready():
	# create rows and columns of DetectionNodes
	for i in 30:
		for j in 30:
			var detectionInstance = detectionScene.instance()
			add_child(detectionInstance)
			detectionInstance.position = Vector2((i * 25), (j * 25))
		
		
func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().call_group("DetectionNodeGroup", "reset_active")
