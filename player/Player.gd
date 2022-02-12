extends Area2D


onready var ray = $RayCast2D
var tile_size = 6
var inputs = {"right": Vector2.RIGHT,
			"left": Vector2.LEFT,
			"up": Vector2.UP,
			"down": Vector2.DOWN}


func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2
	connect("inWeapon", self, "checkOverlaps")


func getOverlaps() -> void:
	var space = get_world_2d().direct_space_state
	var results = space.intersect_point(position, 10, [], 2147483647, true, true)
	print(results)
	if results.size() == 0:
		Global.itemOn = Global.items.EMPTY
		return
	for result in results:
		if "Mine" in result.collider.name:
			Global.itemOn = Global.items.MINE
			return
		if "Barricade" in result.collider.name:
			Global.itemOn = Global.items.BARRICADE
			return
		if "Turret" in result.collider.name:
			Global.itemOn = Global.items.TURRET
			return
		if "Laser" in result.collider.name:
			Global.itemOn = Global.items.LASER
			return
	


func _unhandled_input(event):
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)
			getOverlaps()


func move(dir):
	ray.cast_to = inputs[dir] * tile_size
	ray.force_raycast_update()
	if !ray.is_colliding():
		position += inputs[dir] * tile_size


#func _on_Player_area_entered(area: Area2D) -> void:
#	if area.is_in_group("Weapon"):
#		if area.name == "Mine":
#			Global.itemOn = Global.items.MINE
#			print("On Mine")
#		elif area.name == "Barricade":
#			Global.itemOn = Global.items.BARRICADE
#			print("On Barricade")
#		elif area.name == "Turret":
#			Global.itemOn = Global.items.TURRET
#			print("On Turret")
#		elif area.name == "Laser":
#			Global.itemOn = Global.items.LASER
#			print("On Laser")
#		Global.canBuild = false
#
#func _on_Player_area_exited(area: Area2D) -> void:
#	Global.canBuild = true
