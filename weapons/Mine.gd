extends Area2D

signal enemyHit


func _on_Mine_body_entered(body: Node) -> void:
	if body.is_in_group("Enemies"):
		emit_signal("enemyHit")
		body.queue_free()
		queue_free()
