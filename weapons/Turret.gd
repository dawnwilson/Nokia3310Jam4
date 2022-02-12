extends Area2D


var bullet = preload("res://weapons/Bullet.tscn")

func _on_Turret_body_entered(body: Node) -> void:
	if body.is_in_group("Enemies"):
		body.queue_free()
		queue_free()


func _on_ShootTimer_timeout() -> void:
	var newBullet = bullet.instance()
	var bulletPosition = position
	newBullet.position = bulletPosition
	var weaponContainer = get_parent()
	weaponContainer.add_child(newBullet)
