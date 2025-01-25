extends RigidBody2D

@export_range(0, 200) var max_y_speed: float = 50
@export_range(0, 100) var jiggle_width: float = 10
@export_range(0, 0.5) var width_variation: float = 0.0
@export_range(0, 10) var jiggle_speed: float = 10
@export_range(0, 0.5) var speed_variation: float = 0.0

@export var animation: AnimationPlayer

var time: float = 0
var health: float = 2.0

func _ready():
	# Initialize randomized start state
	time = randf() * 1000
	jiggle_width = jiggle_width * randf_range(1 - width_variation / 2, 1 + width_variation / 2)
	jiggle_speed = jiggle_speed * randf_range(1 - speed_variation / 2, 1 + speed_variation / 2)

func damage(amount: float):
	health -= amount
	if health <= 0:
		bubble_popped()

	animation.play("click")

func bubble_popped():
	# Delete node
	queue_free()

# On click
func _on_button_pressed():
	damage(1.0)

# Bubble movement
func _physics_process(delta):
	time += delta

	# Change the horizontal velocity based on a sine wave
	linear_velocity.x = jiggle_width * sin(jiggle_speed * time)

	# Delete the bubble if it goes off the screen
	# Make sure to use the screen position (with get_global_transform_with_canvas())
	if get_global_transform_with_canvas().origin.y < -100:
		queue_free()

# Clamp vertical velocity
func _integrate_forces(state):
	var y_speed = min(abs(max_y_speed), abs(state.linear_velocity.y))
	y_speed = y_speed * sign(state.linear_velocity.y)
	state.linear_velocity.y = y_speed
