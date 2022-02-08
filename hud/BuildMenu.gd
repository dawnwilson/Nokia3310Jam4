extends Control

signal buildWeapon

const MINE_PRICE := 20
const BARRICADE_PRICE := 40
const TURRET_PRICE := 60
const LASER_PRICE := 80

var buildMenu

var mine = preload("res://weapons/Mine.tscn")
var barricade = preload("res://weapons/Barricade.tscn")
var turret = preload("res://weapons/Turret.tscn")
var laser = preload("res://weapons/Laser.tscn")

onready var scrapsLabel = $TextureRect/HBoxContainer/ScrapsLabel

func _ready() -> void:
	Global.connect("adjustedScraps", self, "updateScrapsLabel")


func updateScrapsLabel(amount) -> void:
	scrapsLabel.text = "$:" + str(amount)


func focusOnBuild() -> void:
	updateScrapsLabel(Global.scraps)
	$TextureRect/HBoxContainer/MineButton.grab_focus()


func _on_MineButton_pressed() -> void:
	emit_signal("buildWeapon", mine, MINE_PRICE)


func _on_BarricadeButton_pressed() -> void:
	emit_signal("buildWeapon", barricade, BARRICADE_PRICE)


func _on_TurretButton_pressed() -> void:
	emit_signal("buildWeapon", turret, TURRET_PRICE)


func _on_LaserButton_pressed() -> void:
	emit_signal("buildWeapon", laser, LASER_PRICE)
