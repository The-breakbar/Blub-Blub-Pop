extends Node

@export var popPlayer: AudioStreamPlayer
@export var boingPlayer: AudioStreamPlayer

func _ready():
	Global.bubble_popped.connect(_on_bubble_popped)
	Global.bubble_damaged.connect(_on_bubble_damaged)

func _on_bubble_popped(_points):
	popPlayer.play()

func _on_bubble_damaged():
	boingPlayer.play()
