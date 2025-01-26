class_name BubbleSpawner
extends Node2D

var x_offset: float = 0.0

@export var bubble_scene: PackedScene
@export var big_bubble_scene: PackedScene
@export var huge_bubble_scene: PackedScene
@export var timer: Timer

func set_params(new_spawn_time: float, new_x_offset: float):
	timer.wait_time = new_spawn_time
	x_offset = new_x_offset

func _on_timer_timeout():
	var bubble
	var random_number = randf()
	if random_number < Global.huge_bubble_rate:
		bubble = huge_bubble_scene.instantiate()
	elif random_number < Global.huge_bubble_rate + Global.big_bubble_rate:
		bubble = big_bubble_scene.instantiate()
	else:
		bubble = bubble_scene.instantiate()

	# Randomly offset the bubble's x position
	bubble.position.x += randf_range(-x_offset, x_offset)

	add_child(bubble)

func set_spawn_time(new_spawn_time: float):
	timer.wait_time = new_spawn_time
	timer.start()
