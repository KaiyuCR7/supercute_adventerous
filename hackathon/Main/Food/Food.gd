extends Node2D

var genreGrp = ButtonGroup.new()
var travelGrp = ButtonGroup.new()
var dict = {}

func _ready():
	
	$CanvasLayer/Asian.group = genreGrp
	$CanvasLayer/Italian.group = genreGrp
	$CanvasLayer/Mexican.group = genreGrp
	$CanvasLayer/American.group = genreGrp
	
	$CanvasLayer/Walk.group = travelGrp
	$CanvasLayer/Drive.group = travelGrp
	
func _on_Cancel_pressed():
	get_tree().change_scene("res://Main/Main.tscn")

func _on_Enter_pressed():
	if genreGrp.get_pressed_button() == null || travelGrp.get_pressed_button() == null:
		$CanvasLayer/InvalidLabel.percent_visible = 1
		return
	processSelection(genreGrp.get_pressed_button().text, travelGrp.get_pressed_button().text)
	get_tree().change_scene("res://Main/Results.tscn")

func processSelection(var genre, var distance):
	var index = 0
	var file = File.new()
	file.open("res://activities.json", File.READ)
	dict = parse_json(file.get_as_text())
	for activity in dict:
		var temp = dict[activity]["FoodType"]
		if !(genre in dict[activity]["FoodType"]):
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
