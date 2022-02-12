extends Control


onready var mineTab = $TextureRect/HBoxContainer/MineOptions
onready var barricadeTab = $TextureRect/HBoxContainer/BarricadeOptions
onready var turretTab = $TextureRect/HBoxContainer/TurretOptions
onready var laserTab = $TextureRect/HBoxContainer/LaserOptions


func _ready() -> void:
	turnAllTabsOff()
	visible = false


func focusOnUpgrade() -> void:
	print("Global Item On: " + str(Global.itemOn))
	if Global.itemOn == Global.items.MINE:
		turnAllTabsOff()
		mineTab.visible = true
		mineTab.get_child(0).grab_focus()
	if Global.itemOn == Global.items.BARRICADE:
		turnAllTabsOff()
		barricadeTab.visible = true
		barricadeTab.get_child(0).grab_focus()
	if Global.itemOn == Global.items.TURRET:
		turnAllTabsOff()
		turretTab.visible = true
		turretTab.get_child(0).grab_focus()
	if Global.itemOn == Global.items.LASER:
		turnAllTabsOff()
		laserTab.visible = true
		laserTab.get_child(0).grab_focus()


func turnAllTabsOff() -> void:
	mineTab.visible = false
	barricadeTab.visible = false
	turretTab.visible = false
	laserTab.visible = false
