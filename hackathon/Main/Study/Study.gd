extends Node2D
var environmentGrp = ButtonGroup.new()
var foodQGrp = ButtonGroup.new()
var travelGrp = ButtonGroup.new()
var dict = {}

func _ready():
	$CanvasLayer/Indoor.group = environmentGrp
	$CanvasLayer/Outdoor.group = environmentGrp
	
	$CanvasLayer/YesFood.group = foodQGrp
	$CanvasLayer/NoFood.group = foodQGrp
	
	$CanvasLayer/Walk.group = travelGrp
	$CanvasLayer/Drive.group = travelGrp

func _on_Cancel_pressed():
	get_tree().change_scene("res://Main/Main.tscn")
	
func _on_Enter_pressed():
	var temp = environmentGrp.get_pressed_button()
	if environmentGrp.get_pressed_button() == null || foodQGrp.get_pressed_button() == null || travelGrp.get_pressed_button() == null:
		$CanvasLayer/InvalidLabel.percent_visible = 1
		return
	processSelection(environmentGrp.get_pressed_button().text, foodQGrp.get_pressed_button().text, travelGrp.get_pressed_button().text)
	get_tree().change_scene("res://Main/Results.tscn")

func processSelection(var environment, var foodType, var distance):
	var index = 0
	var file = File.new()
	file.open("res://activities.json", File.READ)
	dict = parse_json(file.get_as_text())
	for activity in dict:
		if dict[activity]["Environment"] != environment:
			continue
		if foodType == "Yes" && dict[activity]["FoodType"] == "None":
			continue
		if foodType == "No" && dict[activity]["FoodType"] != "None":
			continue
		if distance == "Walk" && dict[activity]["Distance"] != "Walking":
			continue
		if dict[activity]["Noise"] == "Loud":
			continue
		UserInput.activityName[index] = activity
		UserInput.address[index] = dict[activity]["Address"]
		UserInput.noise[index] = dict[activity]["Noise"]
		UserInput.environment[index] = dict[activity]["Environment"]
		UserInput.distance[index] = dict[activity]["Distance"]
		UserInput.foodType[index] = dict[activity]["FoodType"]
		UserInput.activityLevel[index] = dict[activity]["ActivityLevel"]
		index += 1
		UserInput.size = index
