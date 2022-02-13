extends Area2D


var level1Sprite = load("res://assets/Weapons/Barricade_Level1.png")
var level2Sprite = load("res://assets/Weapons/Barricade_Level2.png")
var level3Sprite = load("res://assets/Weapons/Barricade_Level3.png")

var level : int


func _ready() -> void:
	level = 1
	$Sprite.texture = level1Sprite
	

func _on_Barricade_body_entered(body: Node) -> void:
	print("Level before hit: " + str(level))
	if body.is_in_group("Enemies"):
		$AudioStreamPlayer.play()
		if level == 3:
			body.queue_free()
			level = 2
			$Sprite.texture = level2Sprite
		elif level == 2:
			body.queue_free()
			level = 1
			$Sprite.texture = level1Sprite
		elif level == 1:
			body.queue_free()
			$CollisionShape2D.disabled = true
			$Sprite.visible = false
			yield($AudioStreamPlayer, "finished")
			queue_free()
	print("Level after hit: " + str(level))


func upgradeWeapon() -> void:
	print("Level before upgrade: " + str(level))
	if level == 1:
		level = 2
		$Sprite.texture = level2Sprite
	elif level == 2:
		level = 3
		$Sprite.texture = level3Sprite
	else:
		print("No More Upgrades!")
	print("Level after upgrade: " + str(level))
