extends Node2D

export var correctIndex = 0
var currentIndex = 0

func reset_holder():
	$Area2D.set_deferred("monitorable", true)
	currentIndex = 0
