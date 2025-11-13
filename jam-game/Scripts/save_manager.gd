extends Node

@export var save_file : Save
var path = "user://save.tres"

func save_data():
	ResourceSaver.save(save_file, path)

func load_data():
	pass
