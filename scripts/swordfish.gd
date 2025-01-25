extends Area2D


func _on_body_entered(body: Node2D):
	
	if body.is_in_group("bubbles"):
		var bubble = body as Bubble
		bubble.damage(10.0)

func _physics_process(delta):
	# move swordfish right
	position.x += 200 * delta

	# destroy swordfish if it goes off screen
	if position.y > get_viewport_rect().size.y:
		queue_free()
