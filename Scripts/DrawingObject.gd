extends Node2D

func _ready():
	$AnimatedSprite.playing = false
	$AnimatedSprite.visible = false

func _on_Main_startAnim():
	$AnimatedSprite.visible = true
	#$AnimtedSprite.frame = 0
	$AnimatedSprite.playing = true


func _on_AnimatedSprite_animation_finished():
	get_tree().change_scene("res://Scenes/Title.tscn")
