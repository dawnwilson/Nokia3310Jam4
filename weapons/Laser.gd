extends Area2D

var beam = preload("res://weapons/LaserBeam.tscn")


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
