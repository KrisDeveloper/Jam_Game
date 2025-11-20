extends CharacterBody2D

#@onready var hit_sound_player = $Hit
@onready var main_scene = self.get_parent().get_parent()
const speed = 400.0


func _process(delta: float) -> void:
	#THE METEOR CONSTANTLY GOES UP.
	velocity.y -= speed * delta
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	#HERE, THE METEOR KILLS THE PLAYER, SLOW DOWN THE
	#SCENE FOR A BIT, AND THEN, THE TIME SCALE GOES BACK
	#TO ITS NORMAL VALUE.
	if body.is_in_group("player"):
		if main_scene.save_manager.sfx_enabled: main_scene.hit_sound_player.playing = true
		body.queue_free()
		Engine.time_scale = 0.3
		await get_tree().create_timer(0.3).timeout
		Engine.time_scale = 1
