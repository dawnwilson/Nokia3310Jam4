extends KinematicBody2D

onready var ray = $RayCast2D
var tile_size = 6


func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2


func _on_Timer_timeout() -> void:
	position += Vector2.LEFT * tile_size
