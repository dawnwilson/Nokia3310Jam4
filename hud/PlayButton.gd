extends TextureButton


var game = preload("res://Game.tscn")

func _ready() -> void:
	grab_focus()

func _on_PlayButton_pressed() -> void:
	get_tree().change_scene_to(game)
