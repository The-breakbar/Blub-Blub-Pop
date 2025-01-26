class_name Status
extends MarginContainer

@export var money_label: Label
@export var status_label: Label

func _ready():
	draw()

	Global.bubble_popped.connect(func(_points: int): draw())
	Global.upgrade_bought.connect(func(): draw())

func draw():
	money_label.text = "Money: " + str(round(Global.money))
	status_label.text = "Pops: " + str(Global.pops) + "/10000"
