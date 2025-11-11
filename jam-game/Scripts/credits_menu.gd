extends Node2D

@export var credits : Action_Button

func _process(delta: float) -> void:
	credits.button.pressed.connect(trigger_credits)
	
	if visible and Input.is_action_just_pressed("click"):
		visible = false

func trigger_credits():
	visible = true
