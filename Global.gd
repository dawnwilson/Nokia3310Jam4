extends Node

signal adjustedScraps 

var canBuild : bool = true
var scraps := 25 setget setScraps, getScraps
var itemOn

enum items {EMPTY, MINE, BARRICADE, TURRET, LASER}

func setScraps(amount) -> void:
	scraps += amount
	emit_signal("adjustedScraps", Global.getScraps())


func getScraps() -> int:
	return scraps


func _process(delta: float) -> void:
	if canBuild == true:
		itemOn = items.EMPTY
	if Input.is_key_pressed(KEY_9):
		setScraps(150)
