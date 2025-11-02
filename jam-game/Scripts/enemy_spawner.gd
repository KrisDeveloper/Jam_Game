extends Node2D

var aux_pos : Vector2

var apparition_time : float
var rng = RandomNumberGenerator.new()
var enemy = preload("res://Scenes/enemy.tscn")

func _ready() -> void:
	var child = find_child("ColorRect")
	aux_pos = child.position
	spawn()

func _process(delta: float) -> void:
	$"../Label".text = str(apparition_time)

func spawn():
	var enemy_instance = enemy.instantiate()
	enemy_instance.position = aux_pos
	add_child(enemy_instance)
	apparition_time = rng.randf_range(0.5, 1.0)
	await get_tree().create_timer(apparition_time).timeout
	spawn()
