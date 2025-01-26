extends Control

@export var center: Marker2D
@export var spawner: PackedScene

@export_range(0, 20) var start_spawners: int = 1
@export_range(0, 500) var max_distance: float = 200

@export_range(0.1, 5.0) var spawn_time: float = 2.0
@export_range(0.0, 150.0) var x_offset: float = 50

var spawners: Array[BubbleSpawner] = []

func _ready():
	for i in range(start_spawners):
		add_spawner()

func add_spawner():
	var spawner_num = spawners.size() + 1

	# Calculate new spawner positions
	var separation = min(size.x / (spawner_num + 1), max_distance)
	var start = center.position.x - separation * ((spawner_num + 1) / 2.0) + separation
	for i in range(spawner_num - 1):
		spawners[i].position.x = start + i * separation

	# Create a new spawner
	var new_spawner = spawner.instantiate() as BubbleSpawner
	new_spawner.set_params(spawn_time, x_offset)
	new_spawner.position.x = start + (spawner_num - 1) * separation

	spawners.append(new_spawner)
	add_child(new_spawner)
