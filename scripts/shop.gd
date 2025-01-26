extends VBoxContainer

@export var spawners_upgrade: ShopUpgrade
@export var spawner_handler: SpawnerHandler
@export var spawner_speed_upgrade: ShopUpgrade

@export var big_bubble_upgrade: ShopUpgrade
@export var huge_bubble_upgrade: ShopUpgrade

func _ready():
	spawners_upgrade.set_cost_function(func(x: int): return 50 + 10 * x ** 3)
	spawners_upgrade.set_upgrade_function(func(_x: int): spawner_handler.add_spawner())

	spawner_speed_upgrade.set_cost_function(func(x: int): return 10 + 5 * x ** 2)
	spawner_speed_upgrade.set_upgrade_function(func(x: int): spawner_handler.update_spawner_times(2.0 - (x - 1) * 0.05))

	big_bubble_upgrade.set_cost_function(func(x: int): return 2 * (2 * x + 5) ** 2)
	big_bubble_upgrade.set_upgrade_function(func(_x: int): Global.big_bubble_rate += 0.05)

	huge_bubble_upgrade.set_cost_function(func(x: int): return round(4 * (2 * x + 5) ** 2.5))
	huge_bubble_upgrade.set_upgrade_function(func(_x: int): Global.huge_bubble_rate += 0.05)
