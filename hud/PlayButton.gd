extends TextureButton


var game = preload("res://Game.tscn")

func _ready() -> void:
	grab_focus()

func _on_PlayButton_pressed() -> void:
	get_tree().change_scene_to(game)
	Global.startTime = OS.get_unix_time()
