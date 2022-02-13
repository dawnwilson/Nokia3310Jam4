extends Area2D



func _on_LaserBeam_body_entered(body: Node) -> void:
	if body.is_in_group("Enemies"):
		body.queue_free()
		queue_free()


func upgradeWeapon() -> void:
	return
