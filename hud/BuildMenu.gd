extends Control

signal buildWeapon

const MINE_PRICE := 20
const BARRICADE_PRICE := 40
const TURRET_PRICE := 60
const LASER_PRICE := 80

onready var scrapsLabel = $TextureRect/HBoxContainer/ScrapsLabel

var mine = preload("res://weapons/Mine.tscn")
var barricade = preload("res://weapons/Barricade.tscn")
var turret
var laser


func _ready() -> void:
	updateScrapsLabel(Global.scraps)


func updateScrapsLabel(amount) -> void:
	scrapsLabel.text = "$:" + str(amount)


func focusOnBuild() -> void:
	$TextureRect/HBoxContainer/MineButton.grab_focus()


func _on_MineButton_pressed() -> void:
	emit_signal("buildWeapon", mine, MINE_PRICE)


func _on_BarricadeButton_pressed() -> void:
	emit_signal("buildWeapon", barricade, BARRICADE_PRICE)


func _on_TurretButton_pressed() -> void:
	emit_signal("buildWeapon", turret, TURRET_PRICE)


func _on_LaserButton_pressed() -> void:
	emit_signal("buildWeapon", laser, LASER_PRICE)
