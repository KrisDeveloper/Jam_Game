extends Node2D

@onready var score_label = $HUD/Score
@onready var player = $player
@onready var save_manager = $Save_Manager
@onready var hit_sound_player = $Hit
@onready var music_player = $Music

func _ready() -> void:
	save_manager.load_data()
	save_manager.current_score = 0
	
	music_player.playing = save_manager.music_enabled

func _process(delta: float) -> void:
	score_label.text = "SCORE: " + str(save_manager.current_score)
	
	if save_manager.current_score > save_manager.current_high_score:
		save_manager.current_high_score = save_manager.current_score
	
	if Input.is_action_pressed("ui_cancel"):
		save_manager.save_data()
		get_tree().change_scene_to_file("res://Scenes/menu.tscn")


func _on_meteor_destroy_trigger_body_entered(body: CharacterBody2D) -> void:
	if body.is_in_group("meteor"):
		#IF THE PLAYER ISNT DEAD, ADDS ONE TO THE SCORE.
		if not player == null: save_manager.current_score += 1
		body.queue_free()
