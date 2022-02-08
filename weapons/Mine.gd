extends Area2D



func _on_Mine_body_entered(body: Node) -> void:
	if body.name == "Player":
		Global.canBuild = false
	if body.is_in_group("Enemies"):
		body.queue_free()
		queue_free()


func _on_Mine_body_exited(body: Node) -> void:
	if body.name == "Player":
		Global.canBuild = true
