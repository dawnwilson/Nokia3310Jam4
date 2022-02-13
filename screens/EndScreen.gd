extends Control

var totalTime


func _ready() -> void:
	totalTime = (Global.endTime - Global.startTime)
	var string = "Seconds lived: %s"
	var filledString = string % [totalTime]
	$timeLabel.text = filledString
