extends Area2D



func _on_LaserBeam_body_entered(body: Node) -> void:
	if body.is_in_group("Enemies"):
		$AudioStreamPlayer.play()
		body.queue_free()
		$CollisionShape2D.disabled = true
		$AnimatedSprite.visible = false
		yield($AudioStreamPlayer, "finished")
		queue_free()


func upgradeWeapon() -> void:
	return
