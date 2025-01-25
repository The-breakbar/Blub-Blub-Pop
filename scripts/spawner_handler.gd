extends Control

@export var center: Marker2D
@export var spawner: PackedScene

@export_range(0, 20) var start_spawners: int = 1
@export_range(0, 500) var max_distance: float = 200

var spawners: Array[BubbleSpawner] = []

func _ready():
	for i in range(start_spawners):
		add_spawner()

func add_spawner():
	var spawner_num = spawners.size() + 1

	# Calculate the separation distance
	# The separation distance has to fit start_spawners + 1 times into the width
	# If it doesn't fit, calculate the maximum separation distance that works
	var separation = min(size.x / (spawner_num + 1), max_distance)
	print("Separation: ", separation)

	# The start_spawners should be centered around center, if it's odd the middle one should be on center, if even the middle two should be around center
	var start = center.position.x - separation * ((spawner_num + 1) / 2.0) + separation
	print("Start: ", start)

	for i in range(spawner_num - 1):
		# Adjust position of existing spawners
		spawners[i].position.x = start + i * separation

	# Create a new spawner
	var new_spawner = spawner.instantiate() as BubbleSpawner
	spawners.append(new_spawner)
	new_spawner.position.x = start + (spawner_num - 1) * separation
	add_child(new_spawner)
