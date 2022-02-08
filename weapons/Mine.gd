extends Area2D

signal enemyHit

func _ready() -> void:
	yield(get_parent(), "ready")
	connect("enemyHit", owner, "explode")
	print(owner)


func _on_Mine_body_entered(body: Node) -> void:
	if body.name == "Player":
		Global.canBuild = false
		Global.itemOn = Global.items.MINE
	if body.is_in_group("Enemies"):
		emit_signal("enemyHit")
		body.queue_free()
		queue_free()


func _on_Mine_body_exited(body: Node) -> void:
	if body.name == "Player":
		Global.canBuild = true
		Global.items.EMPTY
