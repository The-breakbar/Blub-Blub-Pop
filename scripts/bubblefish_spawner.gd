extends Node2D


@export var bubblefish_scene: PackedScene

var damage: float = 0.0
var speed: float = 0.0
var size: float = 0.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var bubblefish_upgrade = Global.upgrades["bubblefish"]
	if bubblefish_upgrade:
		print("Bubblefish upgrade found")
		if !bubblefish_upgrade.has_signal("bubblefish_spawned"):
			bubblefish_upgrade.connect("bubblefish_spawned", self, "_on_bubblefish_spawned")
		else:
			print("Bubblefish upgrade signal already connected")
	else:
		print("Bubblefish upgrade not found")


func _on_bubblefish_spawned(damage: float, speed: float, size: float) -> void:
	print("Recieved Bubblefish upgrade signal")
	self.damage = damage
	self.speed = speed
	self.size = size

	var bubblefish = bubblefish_scene.instantiate()
	bubblefish.damage = self.damage
	bubblefish.velocity = Vector2(self.speed, self.speed)
	bubblefish.scale = Vector2(self.size, self.size)

	add_child(bubblefish)
