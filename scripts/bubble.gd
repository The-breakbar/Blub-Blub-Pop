class_name Bubble
extends RigidBody2D

@export_range(0, 200) var max_y_speed: float = 50
@export_range(0, 100) var jiggle_width: float = 10
@export_range(0, 0.5) var width_variation: float = 0.0
@export_range(0, 10) var jiggle_speed: float = 10
@export_range(0, 0.5) var speed_variation: float = 0.0

@export var animation: AnimationPlayer
@export var animatedSprite: AnimatedSprite2D
@export var button: Button

var time: float = 0
@export var health: float = 1.0
@export var points: int = 1

func _ready():
	# Initialize randomized start state
	time = randf() * 1000
	jiggle_width = jiggle_width * randf_range(1 - width_variation / 2, 1 + width_variation / 2)
	jiggle_speed = jiggle_speed * randf_range(1 - speed_variation / 2, 1 + speed_variation / 2)

func damage(amount: float):
	health -= amount

	# If the bubble is dead, pop it
	if health <= 0:
		bubble_popped()
		return

	# Emit signal
	Global.bubble_damaged.emit()

	# Play the click animation
	if animation.is_playing():
		animation.stop()
	animation.play("click")

func bubble_popped():
	Global.bubble_popped.emit(points)
	button.hide()
	animatedSprite.play("default")

# After animation has finished, delete the bubble
func _on_sprite_2d_animation_finished():
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
	if get_global_transform_with_canvas().origin.y < -100:
		queue_free()

# Clamp vertical velocity
func _integrate_forces(state):
	var y_speed = min(abs(max_y_speed), abs(state.linear_velocity.y))
	y_speed = y_speed * sign(state.linear_velocity.y)
	state.linear_velocity.y = y_speed
