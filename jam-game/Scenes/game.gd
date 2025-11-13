extends Node2D

@onready var score_label = $CanvasLayer/Score
@onready var player = $player

func _process(delta: float) -> void:
	score_label.text = "SCORE: " + str(save_manager.current_score)


func _on_meteor_destroy_trigger_body_entered(body: CharacterBody2D) -> void:
	if body.is_in_group("meteor"):
		#IF THE PLAYER ISNT DEAD, ADDS ONE TO THE SCORE.
		if not player == null: save_manager.current_score += 1
		body.queue_free()
