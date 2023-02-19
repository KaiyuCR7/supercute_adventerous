extends Node2D

func _ready():
	for i in UserInput.size:
		$CanvasLayer/Results.add_text("Name: \n\t" + UserInput.activityName[i])
		$CanvasLayer/Results.add_text("\nAddress: \n\t" + UserInput.address[i])
		$CanvasLayer/Results.add_text("\nDistance: \n\t" + UserInput.distance[i])
		$CanvasLayer/Results.add_text("\nEnvironment: \n\t" + UserInput.environment[i])
		$CanvasLayer/Results.add_text("\nFood Type: \n\t" + UserInput.foodType[i])
		$CanvasLayer/Results.add_text("\nNoise: \n\t" + UserInput.noise[i])
		$CanvasLayer/Results.add_text("\nActivity Level: \n\t" + UserInput.activityLevel[i])
		$CanvasLayer/Results.add_text("\n\n")



func _on_HomeBtn_pressed():
	$CanvasLayer/Results.text = ""
	UserInput.reset()
	get_tree().change_scene("res://Main/Main.tscn")
