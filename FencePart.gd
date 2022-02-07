extends Area2D


signal gameOver

export var fullTexture : Texture
export var brokenTexture : Texture

onready var sprite := $Sprite

var health = 1


func _ready() -> void:
	sprite.texture = fullTexture


func _on_body_entered(body: Node) -> void:
	if !body.is_in_group("Enemies"):
		return
		
	if health == 1:
		health -= 1
		sprite.texture = brokenTexture
		print("Hit By Enemy & break fence!")
	elif health == 0:
		emit_signal("gameOver")
		print("Enemy got through the fence. You failed!")
