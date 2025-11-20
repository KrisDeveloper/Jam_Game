extends Node2D

@onready var splash_controller = $Splash_Controller
@onready var flash_screen = $Flash_Screen
@onready var main_menu_container = $Main_Menu_Container
@onready var high_score_label = $Main_Menu_Container/High_Score
@onready var music_player = $Music_Player

func _ready() -> void:
	await get_tree().create_timer(0.3).timeout
	flash_screen.visible = false
	#THE CURSOR BECOMES VISIBLE AGAIN (JUST IN CASE
	#YOU GO BACK TO THE MENU FROM THE GAME SCENE.)
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	#THE TIME SCALE GOES BACK TO NORMAL (JUST IN CASE
	#YOU GO BACK TO THE MENU WHILE THE SCENE IS
	#RALENTIZED.)
	Engine.time_scale = 1
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
	music_player.playing = true
	high_score_label.text = "HIGH SCORE: " + str(save_manager.current_high_score)
