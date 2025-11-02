extends CharacterBody2D

const speed = 400.0

func _ready() -> void:
	await get_tree().create_timer(5).timeout
	queue_free()

func _process(delta: float) -> void:
	velocity.y -= speed * delta
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"): body.queue_free()
