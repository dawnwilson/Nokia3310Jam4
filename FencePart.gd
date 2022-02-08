extends Area2D


signal gameOver

export var fullTexture : Texture
export var brokenTexture : Texture

onready var sprite := $Sprite

var health = 1


func _ready() -> void:
	sprite.texture = fullTexture


func _on_FencePart_body_entered(body: Node) -> void:
	if !body.is_in_group("Enemies"):
		return
		
	if health == 1:
		health -= 1
		sprite.texture = brokenTexture
		body.queue_free()
		# TODO: instance explosion
	elif health == 0:
		body.queue_free()
		emit_signal("gameOver")
		print("Enemy got through the fence. You failed!")
