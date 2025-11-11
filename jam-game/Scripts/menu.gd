extends Node2D

@onready var splash_controller = $Splash_Controller
@onready var main_menu_container = $Main_Menu_Container

func _ready() -> void:
	main_menu_container.position.y = 100000
	splash_controller.position.y = 0
	await get_tree().create_timer(2).timeout
	splash_controller.position.y = 100000
	await get_tree().create_timer(0.5).timeout
	main_menu_container.position.y = 0
