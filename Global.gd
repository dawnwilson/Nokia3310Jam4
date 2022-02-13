extends Node


signal adjustedScraps 

var scraps := 150 setget setScraps, getScraps
var itemOn
var exactWeaponOn
var startTime
var endTime

enum items {EMPTY, MINE, BARRICADE, TURRET, LASER}


func _ready() -> void:
	itemOn = items.EMPTY


func setScraps(amount) -> void:
	scraps += amount
	emit_signal("adjustedScraps", Global.getScraps())


func getScraps() -> int:
	return scraps
