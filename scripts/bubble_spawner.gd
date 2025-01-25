class_name BubbleSpawner
extends Node2D

@export_range(0.1, 5.0) var spawn_time: float = 1.0
@export_range(0.0, 100.0) var x_offset: float = 0.0

@export var bubble_scene: PackedScene
@export var timer: Timer

func _ready():
	timer.wait_time = spawn_time
	timer.start()

func _process(_delta):
	pass

func _on_timer_timeout():
	# Create a new bubble
	var bubble = bubble_scene.instantiate()

	# Randomly offset the bubble's x position
	bubble.position.x += randf_range(-x_offset, x_offset)

	add_child(bubble)
