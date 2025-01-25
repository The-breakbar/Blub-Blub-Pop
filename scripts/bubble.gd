extends RigidBody2D

@export_range(0, 200) var max_y_speed: float = 50
@export_range(0, 100) var jiggle_width: float = 10
@export_range(0, 0.5) var width_var: float = 0.0
@export_range(0, 10) var jiggle_speed: float = 10
@export_range(0, 0.5) var speed_var: float = 0.0

var time: float = 0

func _ready():
	time = randf() * 1000

	jiggle_width = jiggle_width * randf_range(1 - width_var / 2, 1 + width_var / 2)
	jiggle_speed = jiggle_speed * randf_range(1 - speed_var / 2, 1 + speed_var / 2)

func _process(_delta):
	pass

func _physics_process(delta):
	time += delta

	# Change the horizontal velocity based on a sine wave
	linear_velocity.x = jiggle_width * sin(jiggle_speed * time)

func _integrate_forces(state):

	# Clamp the vertical velocity
	var y_speed = min(abs(max_y_speed), abs(state.linear_velocity.y))
	y_speed = y_speed * sign(state.linear_velocity.y)
	state.linear_velocity.y = y_speed

func _on_button_pressed():
	# Delete node
	queue_free()
