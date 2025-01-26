class_name Bubblefish
extends Area2D

# Speed and direction of the ball
var velocity: Vector2 = Vector2(200, 200)
@export_range(0, 10) var damage: float = 3.0


func _ready():
	# Connect the body_entered signal to detect when objects enter the ball's area
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("bubblefish_upgraded", Callable(self, "on_bubblefish_upgraded"))

	# disable this node
	disable()

func disable():
	set_process(false)
	hide()
	$CollisionShape2D.disabled = true

func enable():
	set_process(true)
	show()
	$CollisionShape2D.disabled = false
	
func _physics_process(delta):
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

func on_bubblefish_upgraded(damage: float, factor: float, size: float) -> void:
	print("Recieved Swordfish upgrade signal")
	self.damage = damage
	var xspeed = self.velocity[0]
	var yspeed = self.velocity[1]
	self.velocity = Vector2(xspeed * factor, yspeed * factor)
	scale = Vector2(size, size)
