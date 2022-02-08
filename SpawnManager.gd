extends Node2D

onready var enemy = preload("res://enemies/Enemy.tscn")
onready var spawners : Array = $Spawners.get_children()


# TEMP INPUT FOR TRIGGERING ENEMIES
func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_1):
		spawnTempEnemy(0)
	if Input.is_key_pressed(KEY_2):
		spawnTempEnemy(1)
	if Input.is_key_pressed(KEY_3):
		spawnTempEnemy(2)
	if Input.is_key_pressed(KEY_4):
		spawnTempEnemy(3)
	if Input.is_key_pressed(KEY_5):
		spawnTempEnemy(4)
	if Input.is_key_pressed(KEY_6):
		spawnTempEnemy(5)

func spawnTempEnemy(index) -> void:
	var newEnemy = enemy.instance()
	newEnemy.position = spawners[index].position
	$Enemies.add_child(newEnemy)
