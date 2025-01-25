extends Area2D


func _on_body_entered(body: Node2D):
	
	if body.is_in_group("bubbles"):
		var bubble = body as Bubble
		bubble.damage(10.0)
