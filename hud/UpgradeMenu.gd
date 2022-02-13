extends Control

signal upgradeWeapon

const BARRICADE_UPGRADE_COST := 20
const TURRET_UPGRADE_COST := 30
const LASER_UPGRADE_COST := 50

onready var mineTab = $TextureRect/HBoxContainer/MineOptions
onready var barricadeTab = $TextureRect/HBoxContainer/BarricadeOptions
onready var turretTab = $TextureRect/HBoxContainer/TurretOptions
onready var laserTab = $TextureRect/HBoxContainer/LaserOptions


func _ready() -> void:
	turnAllTabsOff()
	visible = false


func focusOnUpgrade() -> void:
	if Global.itemOn == Global.items.MINE || Global.items.EMPTY:
		turnAllTabsOff()
		mineTab.visible = true
		mineTab.get_child(0).grab_focus()
	if Global.itemOn == Global.items.BARRICADE:
		turnAllTabsOff()
		barricadeTab.visible = true
		if Global.getScraps() < BARRICADE_UPGRADE_COST:
			barricadeTab.get_node("upgrade").visible = false
			barricadeTab.get_node("NoUpgrades").visible = true
		if Global.getScraps() >= BARRICADE_UPGRADE_COST:
			barricadeTab.get_node("upgrade").visible = true
			barricadeTab.get_node("NoUpgrades").visible = false
		barricadeTab.get_child(0).grab_focus()
	if Global.itemOn == Global.items.TURRET:
		turnAllTabsOff()
		turretTab.visible = true
		if Global.getScraps() < TURRET_UPGRADE_COST:
			turretTab.get_node("upgrade").visible = false
			turretTab.get_node("NoUpgrades").visible = true
		if Global.getScraps() >= TURRET_UPGRADE_COST:
			turretTab.get_node("upgrade").visible = true
			turretTab.get_node("NoUpgrades").visible = false
		turretTab.get_child(0).grab_focus()
	if Global.itemOn == Global.items.LASER:
		turnAllTabsOff()
		laserTab.visible = true
		if Global.getScraps() < LASER_UPGRADE_COST:
			laserTab.get_node("upgrade").visible = false
			laserTab.get_node("NoUpgrades").visible = true
		if Global.getScraps() >= TURRET_UPGRADE_COST:
			laserTab.get_node("upgrade").visible = true
			laserTab.get_node("NoUpgrades").visible = false
		laserTab.get_child(0).grab_focus()


func turnAllTabsOff() -> void:
	mineTab.visible = false
	barricadeTab.visible = false
	turretTab.visible = false
	laserTab.visible = false


func _on_Turret_upgrade_pressed() -> void:
	emit_signal("upgradeWeapon")


func _on_Laser_upgrade_pressed() -> void:
	emit_signal("upgradeWeapon")


func _on_Barricade_upgrade_pressed() -> void:
	emit_signal("upgradeWeapon")
