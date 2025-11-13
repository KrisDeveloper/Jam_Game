extends Node2D

@onready var splash_controller = $Splash_Controller
@onready var main_menu_container = $Main_Menu_Container

func _ready() -> void:
	#THE SPLASH APPEARS.
	main_menu_container.position.y = 100000
	splash_controller.position.y = 0
	#WAITS FOR 2 SECONDS.
	await get_tree().create_timer(2).timeout
	#THE SCREEN GOES BLANK FOR A MOMENT.
	splash_controller.position.y = 100000
	#WAITS A HALF SECOND.
	await get_tree().create_timer(0.5).timeout
	#AND THEN, THE MAIN MENU APPEARS.
	main_menu_container.position.y = 0
