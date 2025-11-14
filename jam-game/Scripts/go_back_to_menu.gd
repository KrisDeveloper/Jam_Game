#THIS SCRIPT IS ONLY IN CHARGE OF MAKE THE "<ESCAPE>
#GO BACK TO MENU" TEXT BLINKING.
extends Label

func _ready() -> void:
	blinking_text()

func blinking_text():
	visible = true
	await get_tree().create_timer(0.5).timeout
	visible = false
	await get_tree().create_timer(0.5).timeout
	blinking_text()
