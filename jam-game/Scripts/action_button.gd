class_name Action_Button
extends Node2D

@export var icon : Sprite2D
@onready var label = $Label
@onready var button = $Button

var default_color = Color8(255, 255, 47)

var is_disabled : bool

func _process(delta: float) -> void:
	if button.is_hovered():
		icon.modulate = Color.WHITE
		label.modulate = Color.WHITE
	elif is_disabled:
		icon.modulate = Color.RED
		label.modulate = Color.RED
	else:
		icon.modulate = default_color
		label.modulate = default_color
	
	button.pressed.connect(action)

func action():
	if label.text == "PLAY": get_tree().change_scene_to_file("res://Scenes/game.tscn")
	elif label.text == "MUSIC": is_disabled = not is_disabled
	elif label.text == "SFX": is_disabled = not is_disabled
	elif label.text == "QUIT": get_tree().quit()
