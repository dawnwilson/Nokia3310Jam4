extends Node2D

onready var enemy = preload("res://enemies/Enemy.tscn")

onready var spawners : Array = $Spawners.get_children()


func _ready() -> void:
	var newEnemy = enemy.instance()
	newEnemy.position = spawners[0].position
	$Enemies.add_child(newEnemy)
	print(spawners)
