extends Node2D

var enterPressed = false


func _on_Enter_pressed():
	enterPressed = true

func _process(delta):
	if enterPressed == true:
		get_tree().change_scene("res://Main/Results.tscn")
