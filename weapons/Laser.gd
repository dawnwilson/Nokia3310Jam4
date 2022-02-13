extends Area2D

var beam = preload("res://weapons/LaserBeam.tscn")
onready var level := 1

func _ready() -> void:
	var newBeam1 = beam.instance()
	var newBeam2 = beam.instance()
	var beamPos1 = Vector2(position.x + 6, position.y)
	var beamPos2 = Vector2(position.x + 12, position.y)
	newBeam1.position = beamPos1
	newBeam2.position = beamPos2
	var weaponContainer = get_parent()
	weaponContainer.add_child(newBeam1)
	weaponContainer.add_child(newBeam2)


func _on_Laser_body_entered(body: Node) -> void:
	if body.name == "Player":
		Global.canBuild = false
		Global.itemOn = Global.items.LASER
	if body.is_in_group("Enemies"):
		body.queue_free()
		queue_free()


func upgradeWeapon() -> void:
	var beamPos1 = Vector2(position.x + 6, position.y)
	var beamPos2 = Vector2(position.x + 12, position.y)
	var beamPos3 = Vector2(position.x + 18, position.y)
	var beamPos4 = Vector2(position.x + 24, position.y)
	
	var space = get_world_2d().direct_space_state
	var results1 = space.intersect_point(beamPos1, 10, [], 2147483647, true, true)
	var results2 = space.intersect_point(beamPos2, 10, [], 2147483647, true, true)
	var results3 = space.intersect_point(beamPos3, 10, [], 2147483647, true, true)
	var results4 = space.intersect_point(beamPos4, 10, [], 2147483647, true, true)
	
	if level == 1:
		level = 2
		if results1.size() == 0:
			var newBeam1 = beam.instance()
			newBeam1.position = beamPos1
			var weaponContainer = get_parent()
			weaponContainer.add_child(newBeam1)
		if results2.size() == 0:
			var newBeam2 = beam.instance()
			newBeam2.position = beamPos2
			var weaponContainer = get_parent()
			weaponContainer.add_child(newBeam2)
		if results3.size() == 0:
			var newBeam3 = beam.instance()
			newBeam3.position = beamPos3
			var weaponContainer = get_parent()
			weaponContainer.add_child(newBeam3)
	elif level == 2:
		if results1.size() == 0:
			var newBeam1 = beam.instance()
			newBeam1.position = beamPos1
			var weaponContainer = get_parent()
			weaponContainer.add_child(newBeam1)
		if results2.size() == 0:
			var newBeam2 = beam.instance()
			newBeam2.position = beamPos2
			var weaponContainer = get_parent()
			weaponContainer.add_child(newBeam2)
		if results3.size() == 0:
			var newBeam3 = beam.instance()
			newBeam3.position = beamPos3
			var weaponContainer = get_parent()
			weaponContainer.add_child(newBeam3)
		if results4.size() == 0:
			var newBeam4 = beam.instance()
			newBeam4.position = beamPos4
			var weaponContainer = get_parent()
			weaponContainer.add_child(newBeam4)
