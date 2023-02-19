extends Node2D


var environmentGrp = ButtonGroup.new()
var levelGrp = ButtonGroup.new()
var travelGrp = ButtonGroup.new()
var dict = {}

func _ready():

	$CanvasLayer/Indoor.group = environmentGrp
	$CanvasLayer/Outdoor.group = environmentGrp

	$CanvasLayer/Activity1.group = levelGrp
	$CanvasLayer/Activity2.group = levelGrp
	$CanvasLayer/Activity3.group = levelGrp

	$CanvasLayer/Walk.group = travelGrp
	$CanvasLayer/Drive.group = travelGrp
	
func _on_Cancel_pressed():
	get_tree().change_scene("res://Main/Main.tscn")

func _on_Enter_pressed():
	if environmentGrp.get_pressed_button() == null || levelGrp.get_pressed_button() == null || travelGrp.get_pressed_button() == null:
		$CanvasLayer/InvalidLabel.percent_visible = 1
		return
	processSelection(environmentGrp.get_pressed_button().text, levelGrp.get_pressed_button().text, travelGrp.get_pressed_button().text)
	get_tree().change_scene("res://Main/Results.tscn")

func processSelection(var environment, var levelGrp, var distance):
	var index = 0
	var file = File.new()
	file.open("res://activities.json", File.READ)
	dict = parse_json(file.get_as_text())
	for activity in dict:
		if dict[activity]["ActivityLevel"] == "None":
			continue
		if dict[activity]["Environment"] != environment && dict[activity]["Environment"] != "Indoor/Outdoor":
			continue
		if int(levelGrp) + 1 < activityToInt(dict[activity]["ActivityLevel"]):
			continue
		if distance == "Walk" && dict[activity]["Distance"] != "Walking":
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

func activityToInt(var string):
	match (string):
		"Any":
			return 0
		"None":
			return 1
		"Low":
			return 2
		"Medium":
			return 3
		"High":
			return 4
