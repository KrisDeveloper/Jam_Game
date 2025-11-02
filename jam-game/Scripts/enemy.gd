extends CharacterBody2D

const speed = 250.0

func _process(delta: float) -> void:
	velocity.y -= speed * delta
	move_and_slide()
