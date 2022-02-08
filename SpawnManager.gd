extends Node2D

onready var enemy = preload("res://enemies/Enemy.tscn")
onready var spawners : Array = $Spawners.get_children()

onready var spawnTimer = $SpawnTimer
onready var difficultyTimer = $DifficultyTimer
var rng = RandomNumberGenerator.new()


func _ready():
	spawnTimer.start()
	difficultyTimer.start()
	rng.randomize()


func _on_DifficultyTimer_timeout() -> void:
	if spawnTimer.wait_time > 1:
		spawnTimer.wait_time -= 0.25
	else:
		difficultyTimer.stop()


func _on_SpawnTimer_timeout() -> void:
	var randomNum = rng.randi_range(0, spawners.size() - 1)
	spawnEnemy(randomNum)


func spawnEnemy(index) -> void:
	var newEnemy = enemy.instance()
	newEnemy.position = spawners[index].position
	$Enemies.add_child(newEnemy)
