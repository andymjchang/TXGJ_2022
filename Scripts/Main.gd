extends Node2D

onready var detectionScene = preload("res://Scenes/DetectionNode.tscn")

export var defaultXOffset = 115
export var defaultYOffset = 10

func _ready():
	# create rows and columns of DetectionNodes
	
	for i in 50:
		for j in 50:
			var detectionInstance = detectionScene.instance()
			add_child(detectionInstance)
			detectionInstance.position = Vector2((i * 5) + defaultXOffset, (j * 5) + defaultYOffset)
		
		
func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().call_group("DetectionNodeGroup", "reset_active")
