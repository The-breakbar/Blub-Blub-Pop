extends Area2D

@export_range(0, 10) var damage: float = 3.0

func _on_body_entered(body: Node2D):
	if body.is_in_group("bubbles"):
		var bubble = body as Bubble
		bubble.damage(damage)

func _physics_process(delta):
	# move swordfish right
	position.x += 200 * delta

	# destroy swordfish if it goes off screen
	if position.y > get_viewport_rect().size.y:
		queue_free()
