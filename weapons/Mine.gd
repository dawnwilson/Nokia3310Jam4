extends Area2D

signal enemyHit


func _on_Mine_body_entered(body: Node) -> void:
	if body.is_in_group("Enemies"):
		$AudioStreamPlayer.play()
		emit_signal("enemyHit")
		body.queue_free()
		$CollisionShape2D.disabled = true
		$AnimatedSprite.visible = false
		yield($AudioStreamPlayer, "finished")
		queue_free()
