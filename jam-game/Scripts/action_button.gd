class_name Action_Button
extends Node2D

#THE IMAGE THAT THE BUTTON SHOULD DISPLAY (THIS VARIABLE
#JUST GETS THE ICON TO CHANGE ITS COLOR DEPENDING ON THE
#BUTTON STATE, BUT YOU HAVE TO SET THE VISIBILITY FOR 
#THE ICON THAT THE BUTTON SHOULD DISPLAY MANUALLY ON 
#THE HIERARCHY.
@export var icon : Sprite2D

#MANAGES THE TEXT THAT THE BUTTON SHOULD DISPLAY.
@onready var label = $Label

#THE BUTTON ITSELF.
@onready var button = $Button

#THE COLOR OF THE BUTTON IN ITS DEFAULT STATE.
var default_color = Color8(255, 255, 47)

#THIS VARIABLE IS USED TO CHANGE A BOOLEAN FROM HERE
#AND MAKE CHANGES ON THE BUTTON'S COLOR MEANTIME.
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


#THIS FUNCTION GETS THE ACTION THAT THE BUTTON SHOULD DO
#DEPENDING ON ITS TEXT.
func action():
	if label.text == "PLAY": get_tree().change_scene_to_file("res://Scenes/game.tscn")
	elif label.text == "MUSIC": is_disabled = not is_disabled
	elif label.text == "SFX": is_disabled = not is_disabled
	elif label.text == "QUIT": get_tree().quit()
