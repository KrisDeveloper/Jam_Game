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
