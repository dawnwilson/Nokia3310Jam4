extends Area2D



func _on_Turret_body_entered(body: Node) -> void:
	if body.is_in_group("Enemies"):
		body.queue_free()
		queue_free()
