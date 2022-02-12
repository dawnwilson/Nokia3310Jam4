extends Area2D


var tile_size = 6


func _on_MoveSpeed_timeout() -> void:
	position += Vector2.RIGHT * tile_size


func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()


func _on_Bullet_body_entered(body: Node) -> void:
	if body.is_in_group("Enemies"):
		body.queue_free()
		queue_free()
