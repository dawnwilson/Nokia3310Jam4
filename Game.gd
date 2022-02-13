extends Node2D

onready var buildTaskBar := $TaskBar/BuildMenu
onready var upgradeMenu := $TaskBar/UpgradeMenu
onready var buildAudioPlayer := $AudioStreamPlayer
onready var hitAudioPlayer := $AudioStreamPlayer2

var endScreen = load("res://screens/EndScreen.tscn")

var isBuildOpen = false
var isUpgradeOpen = false


func _ready() -> void:
	buildTaskBar.visible = false
	$Player.connect("playerMoved", self, "checkIfUpgradeOpen")
	$TaskBar/BuildMenu.connect("buildWeapon", self, "buildWeapon")
	upgradeMenu.connect("upgradeWeapon", self, "upgradeWeapon")


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("build") && !isBuildOpen:
		upgradeMenu.visible = false
		buildTaskBar.visible = true
		isUpgradeOpen = false
		isBuildOpen = true
		buildTaskBar.focusOnBuild()
	elif Input.is_action_just_pressed("build") && isBuildOpen:
		buildTaskBar.visible = false
		upgradeMenu.visible = false
		isUpgradeOpen = false
		isBuildOpen = false
	if Input.is_action_just_pressed("upgrade") && !isUpgradeOpen:
		upgradeMenu.visible = true
		buildTaskBar.visible = false
		isUpgradeOpen = true
		isBuildOpen = false
		upgradeMenu.focusOnUpgrade()
	elif Input.is_action_just_pressed("upgrade") && isUpgradeOpen:
		buildTaskBar.visible = false
		upgradeMenu.visible = false
		isUpgradeOpen = false
		isBuildOpen = false
	

func gameOver() -> void:
	get_tree().change_scene_to(endScreen)


func buildWeapon(weaponType, weaponPrice : int) -> void:
	if weaponPrice <= Global.getScraps():
		var newWeapon = weaponType.instance()
		var position = $Player.position
		if canBuildCheck():
			newWeapon.position = position
			$Weapons.add_child(newWeapon)
			Global.setScraps(-weaponPrice)
			buildAudioPlayer.play()
			$Player.getOverlaps()
		else:
			print("Can't Build There!")
	else:
		print("You don't have enough scraps to build that!")


func canBuildCheck() -> bool:
	return Global.itemOn == Global.items.EMPTY


func explode() -> void:
	hitAudioPlayer.play()


func updateUpgradeTab() -> void:
	upgradeMenu.focusOnUpgrade()


func checkIfUpgradeOpen() -> void:
	if isUpgradeOpen:
		updateUpgradeTab()


func upgradeWeapon() -> void:
	var weaponContainer = $Weapons
	var weaponNode = weaponContainer.get_node(Global.exactWeaponOn)
	weaponNode.queue_free()
