extends Node

signal adjustedScraps 

var canBuild : bool = true
var scraps := 0 setget setScraps, getScraps



func setScraps(amount) -> void:
	scraps += amount
	emit_signal("adjustedScraps", Global.getScraps())


func getScraps() -> int:
	return scraps


func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_9):
		setScraps(150)
