extends Node2D

export var index = 0

var selected = false
var selectable = true 

var xSet 
var ySet 

onready var mat = get_node("JigsawPieces").get_material()

func _ready():
	$JigsawPieces.frame = index
	xSet = global_position.x
	ySet = global_position.y
	
func _process(_delta):
	if selected:
		followMouse()

func followMouse():
	position = get_global_mouse_position()
	position = Vector2(position.x - 25, position.y - 25)
	
func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and selectable:
			selected = true
			$Area2D.monitoring = false
		else:
			# mouse is released
			selected = false
			$Area2D.monitoring = true

func toggle_outline(value):
	mat.set_shader_param("opacity", value)

func _on_Area2D_area_entered(area):
	if area.is_in_group("holder"):
		var parent = area.get_parent()
		parent.currentIndex = index
		$Area2D.set_deferred("monitoring", false)
		area.set_deferred("monitorable", false)
		selectable = false
		#toggle_outline(0)
		global_position = Vector2(area.global_position.x - 25, area.global_position.y - 25)
		
func reset_pos():
	global_position = Vector2(xSet, ySet)
	$Area2D.set_deferred("monitoring", true)
	selectable = true
	
func end_level():
	queue_free()
