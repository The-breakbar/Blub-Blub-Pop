class_name SwordfishSpawner
extends Node2D

@export var swordfish_scene: PackedScene
@export var timer: Timer

var damage: float = 0.0
var min_time: float = 0.0
var max_time: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	timer = $Timer
	var swordfish_upgrade = Global.upgrades["swordfish"]
	if swordfish_upgrade:
		print("Swordfish upgrade found")
		set_next_spawn_time()
		# swordfish_upgrade.connect("spawn_timing_updated", self, "_on_spawn_timing_updated")
		# _on_spawn_timing_updated(swordfish_upgrade.get_spawn_interval())
		# check if the signal is connected
		if !swordfish_upgrade.has_signal("swordfish_upgraded"):
			swordfish_upgrade.connect("swordfish_upgraded", self, "_on_swordfish_upgraded")
		else:
			print("Swordfish upgrade signal already connected")
	else:
		print("Swordfish upgrade not found")

func _on_swordfish_upgraded(damage: float, min_time: float, max_time: float):
	print("Recieved Swordfish upgrade signal")
	self.damage = damage
	self.min_time = min_time
	self.max_time = max_time
	set_next_spawn_time()

func set_next_spawn_time():
	timer.wait_time = randf_range(min_time, max_time)
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timer_timeout():
	# Create a new swordfish
	var swordfish = swordfish_scene.instantiate()

	# Randomly offset the swordfish's y position
	swordfish.position.x += randf_range(-10, 10)

	add_child(swordfish)
