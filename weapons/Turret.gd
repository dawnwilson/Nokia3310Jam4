extends Area2D


var bullet = preload("res://weapons/Bullet.tscn")
onready var level := 1


func _on_Turret_body_entered(body: Node) -> void:
	if body.is_in_group("Enemies"):
		$AudioStreamPlayer.play()
		body.queue_free()
		$CollisionShape2D.disabled = true
		$Sprite.visible = false
		yield($AudioStreamPlayer, "finished")
		queue_free()


func _on_ShootTimer_timeout() -> void:
	var newBullet = bullet.instance()
	var bulletPosition = position
	newBullet.position = bulletPosition
	var weaponContainer = get_parent()
	weaponContainer.add_child(newBullet)


func upgradeWeapon() -> void:
	if level == 1:
		level = 2
		$ShootTimer.wait_time = 4
	elif level == 2:
		$ShootTimer.wait_time = 2
