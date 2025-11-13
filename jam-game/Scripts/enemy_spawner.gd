extends Node2D

#THE POSITION IN WHERE THE METEOR SHOULD SPAWN.
var aux_pos : Vector2

#THE TIME THAT THE METEOR SHOULD TAKE TO SPAWN.
var apparition_time : float
var rng = RandomNumberGenerator.new()
var enemy = preload("res://Scenes/enemy.tscn")

func _ready() -> void:
	#THIS IS THE POINT THAT THE METEOR WILL TAKE AS
	#A REFERENCE TO SPAWN.
	var child = find_child("ColorRect")
	aux_pos = child.position
	spawn()

func spawn():
	#SETS THE APPARITION TIME.
	apparition_time = rng.randf_range(0.5, 2.5)
	#WAITS THAT LONG.
	await get_tree().create_timer(apparition_time).timeout
	#THEN CREATES THE ENEMY INSTANCE.
	var enemy_instance = enemy.instantiate()
	enemy_instance.position = aux_pos
	#AND ADDS IT TO THE SCENE.
	add_child(enemy_instance)
	#FINALLY, THE FUNCTION CALLS ITSELF AGAIN.
	spawn()
