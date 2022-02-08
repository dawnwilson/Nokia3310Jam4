extends Node2D

onready var buildTaskBar := $TaskBar/BuildMenu
var isBuildOpen = false


func _ready() -> void:
	buildTaskBar.visible = false
	$TaskBar/BuildMenu.connect("buildWeapon", self, "buildWeapon")


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("build") && !isBuildOpen:
		buildTaskBar.visible = true
		isBuildOpen = true
		buildTaskBar.focusOnBuild()
	elif Input.is_action_just_pressed("build") && isBuildOpen:
		buildTaskBar.visible = false
		isBuildOpen = false
	if Input.is_action_just_pressed("upgrade"):
		print("Upgrades Open...")
	if Input.is_action_just_pressed("rotate"):
		print("Rotating Object...")


func buildWeapon(weaponType, weaponPrice : int) -> void:
	if weaponPrice <= Global.scraps:
		var newWeapon = weaponType.instance()
		var position = $Player.position
		if canBuildCheck():
			newWeapon.position = position
			$Weapons.add_child(newWeapon)
			Global.scraps -= weaponPrice
			var buildMenu = $TaskBar/BuildMenu
			buildMenu.updateScrapsLabel(Global.scraps)
		else:
			print("Can't Build There!")


func canBuildCheck() -> bool:
	return Global.canBuild
