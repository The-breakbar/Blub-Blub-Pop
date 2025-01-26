extends Area2D

# Speed and direction of the ball
var velocity: Vector2 = Vector2(200, 200)
@export_range(0, 10) var damage: float = 3.0


func _ready():
	# Connect the body_entered signal to detect when objects enter the ball's area
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("bubblefish_upgraded", Callable(self, "_on_bubblefish_upgraded"))

func _process(delta):
	# Move the ball
	position += velocity * delta

	# Bounce off screen edges
	if position.x <= 0 or position.x >= get_viewport_rect().size.x - 500:
		velocity.x *= -1
	if position.y <= 0 or position.y >= get_viewport_rect().size.y:
		velocity.y *= -1

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("bubbles"):
		var bubble = body as Bubble
		bubble.damage(damage)

func _on_bubblefish_upgraded(damage: float, speed: float, size: float) -> void:
	print("Recieved Swordfish upgrade signal")
	self.damage = damage
	self.velocity = Vector2(speed, speed)
	scale = Vector2(size, size)
