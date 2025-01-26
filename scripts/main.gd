extends Node

@export var start_windowed: bool = false
@export var status: Status

func _ready():
	if start_windowed:
		set_fullscreen(false)

func set_fullscreen(fullscreen: bool):
	if fullscreen:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		# change window size to 720p
		DisplayServer.window_set_size(Vector2(1280, 720))

func _input(event):
	if event.is_action_pressed("toggle_fullscreen"):
		var fullscreen = DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN
		set_fullscreen(not fullscreen)

	if event.is_action_pressed("quit"):
		get_tree().quit()

	if event.is_action_pressed("cheatcode"):
		Global.money += 1000
		status.draw()
