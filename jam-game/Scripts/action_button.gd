class_name Action_Button
extends Node2D

@export var save_manager : Node

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

@onready var select_sound_player = $Select
@onready var confirm_sound_player = $Confirm

#THE COLOR OF THE BUTTON IN ITS DEFAULT STATE.
var default_color = Color8(255, 255, 47)

#THIS VARIABLE IS USED TO CHANGE A BOOLEAN FROM HERE
#AND MAKE CHANGES ON THE BUTTON'S COLOR MEANTIME.
var is_disabled : bool

func _process(delta: float) -> void:
	if label.text == "MUSIC":
		is_disabled = not save_manager.music_enabled
	elif label.text == "SFX":
		is_disabled = not save_manager.sfx_enabled
		
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
	button.mouse_entered.connect(play_select_sound)


#THIS FUNCTION GETS THE ACTION THAT THE BUTTON SHOULD DO
#DEPENDING ON ITS TEXT.
func action():
	if save_manager.sfx_enabled: confirm_sound_player.playing = true
	
	if label.text == "PLAY":
		if save_manager.sfx_enabled: await confirm_sound_player.finished
		save_manager.save_data()
		get_tree().change_scene_to_file("res://Scenes/game.tscn")
	elif label.text == "MUSIC":
		save_manager.music_enabled = not save_manager.music_enabled 
		is_disabled = not save_manager.music_enabled
	elif label.text == "SFX":
		save_manager.sfx_enabled = not save_manager.sfx_enabled 
		is_disabled = not save_manager.sfx_enabled
	elif label.text == "QUIT":
		save_manager.save_data()
		get_tree().quit()

func play_select_sound():
	if save_manager.sfx_enabled: select_sound_player.playing = true
