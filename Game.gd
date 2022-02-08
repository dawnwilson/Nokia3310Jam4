extends Node2D

onready var buildTaskBar := $TaskBar/BuildMenu
var isBuildOpen = false


func _ready() -> void:
	buildTaskBar.visible = false


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
