extends CharacterBody2D

const speed = 400.0

func _process(delta: float) -> void:
	velocity.y -= speed * delta
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.queue_free()
		Engine.time_scale = 0.3
		await get_tree().create_timer(0.3).timeout
		Engine.time_scale = 1
