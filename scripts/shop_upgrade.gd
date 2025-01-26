class_name ShopUpgrade
extends HBoxContainer

@export var upgrade_name: String = "Bubbles"
@export var button: Button
@export var label: Label

@export var level: int = 1
var cost_function: Callable = func(x: int): return x
var upgrade_function: Callable = func(_x: int): return

func _ready():
	update_text()

func _on_button_pressed():
	level += 1
	label.text = get_label_text()
	button.text = get_button_text()

	# Perform the upgrade
	upgrade_function.call(level)

func update_text():
	label.text = get_label_text()
	button.text = get_button_text()

func set_cost_function(f: Callable):
	cost_function = f
	update_text()

func set_upgrade_function(f: Callable):
	upgrade_function = f

func get_label_text():
	return upgrade_name + " (Lvl " + str(level) + ")"

func get_button_text():
	return "Buy (" + format_number(cost_function.call(level)) + ")"

func format_number(number: float):
	if number >= 10 ** 6:
		return str(round(number / 10 ** 6)) + "M"
	elif number >= 10 ** 3:
		return str(round(number / 100) / 10) + "k"
	else:
		return str(number)
