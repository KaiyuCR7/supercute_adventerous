extends Node2D

func _on_ActiveButton_pressed():
	get_tree().change_scene("res://Main/Active/Active.tscn")

func _on_FoodButton_pressed():
	get_tree().change_scene("res://Main/Food/Food.tscn")
	
func _on_StudyButton_pressed():
	get_tree().change_scene("res://Main/Study/Study.tscn")
	
