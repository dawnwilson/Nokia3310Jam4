extends Area2D


var level1Sprite = load("res://assets/Weapons/Barricade.png")
var level2Sprite = load("res://assets/Weapons/Barricade_Level2.png")

var level = 1


func _on_Barricade_body_entered(body: Node) -> void:
	if body.is_in_group("Enemies"):
		if level == 3:
			body.queue_free()
			$Sprite.texture = level2Sprite
			level = 2
		elif level == 2:
			body.queue_free()
			$Sprite.texture = level1Sprite
			level = 1
		elif level == 1:
			body.queue_free()
			queue_free()
