extends Node

@export var player: AudioStreamPlayer

func _ready():
	Global.bubble_popped.connect(_on_bubble_popped)

func _on_bubble_popped():
	player.play()
