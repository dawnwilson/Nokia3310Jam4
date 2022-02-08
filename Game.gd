extends Node2D

onready var buildTaskBar := $TaskBar/BuildMenu
onready var buildAudioPlayer := $AudioStreamPlayer
onready var hitAudioPlayer := $AudioStreamPlayer2

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
		openUpgradeMenu(Global.itemOn)


func buildWeapon(weaponType, weaponPrice : int) -> void:
	if weaponPrice <= Global.getScraps():
		var newWeapon = weaponType.instance()
		var position = $Player.position
		if canBuildCheck():
			newWeapon.position = position
			$Weapons.add_child(newWeapon)
			Global.setScraps(-weaponPrice)
			buildAudioPlayer.play()
		else:
			print("Can't Build There!")
	else:
		print("You don't have enough scraps to build that!")


func canBuildCheck() -> bool:
	return Global.canBuild

func explode() -> void:
	print("Enemy Explodes!")
	hitAudioPlayer.play()

func openUpgradeMenu(itemOn) -> void:
	if itemOn == 0:
		print("Don't Open Upgrades for Empty Spaces!")
	elif itemOn == 1:
		print("Don't open upgrades for MINE spaces!")
	elif itemOn == 2:
		print("Open Barricade Menu!")
	elif itemOn == 3:
		print("Open Turret Menu!")
	elif itemOn == 4:
		print("Open Laser Menu!")
