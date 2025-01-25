extends Area2D

@export_range(0, 200) var max_speed: float = 50

var time: float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	monitoring = true
	pass # Replace with function body.


func _process(delta):
	# position.x += delta * 100
	pass


func body_entered(body: Node2D) -> void:
	print("other body:", body)

func body_exited(body: Node2D) -> void:
	print("AAAAAAAA")
