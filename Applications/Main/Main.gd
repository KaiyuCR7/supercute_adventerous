extends Node2D

var activePressed = false
var foodPressed = false
var studyPressed = false

func _on_ActiveButton_pressed():
	print("entered active button")
	activePressed = true

func _on_FoodButton_pressed():
	foodPressed = true


func _on_StudyButton_pressed():
	studyPressed = true

func _process(delta):
	if activePressed == true:
		get_tree().change_scene("res://Main/Active/Active.tscn")
	elif foodPressed == true:
		get_tree().change_scene("res://Main/Food/Food.tscn")
	elif studyPressed == true:
		get_tree().change_scene("res://Main/Study/Study.tscn")
