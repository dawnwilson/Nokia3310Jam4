extends Area2D


var tile_size = 6


func _on_MoveSpeed_timeout() -> void:
	position += Vector2.RIGHT * tile_size


func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()
