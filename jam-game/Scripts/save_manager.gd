extends Node

@export var save_file : Save

var current_score : int
var current_high_score : int
var music_enabled : bool
var sfx_enabled : bool
var path = "user://save.tres"

func _ready() -> void:
	if not ResourceLoader.exists(path):
		music_enabled = true
		sfx_enabled = true


func save_data():
	save_file.high_score = current_high_score
	save_file.music_enabled = music_enabled
	save_file.sfx_enabled = sfx_enabled
	ResourceSaver.save(save_file, path)

func load_data():
	if ResourceLoader.exists(path):
		save_file = load(path)
		current_high_score = save_file.high_score
		music_enabled = save_file.music_enabled
		sfx_enabled = save_file.sfx_enabled
