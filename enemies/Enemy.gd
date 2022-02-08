extends KinematicBody2D


onready var ray = $RayCast2D
onready var audioPlayer = $AudioStreamPlayer

var tile_size = 6
const ENEMY_WORTH := 25

func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2


func _on_Timer_timeout() -> void:
	position += Vector2.LEFT * tile_size
	audioPlayer.play()


func _on_Enemy_tree_exiting() -> void:
	Global.setScraps(ENEMY_WORTH)
