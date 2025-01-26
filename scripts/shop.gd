extends VBoxContainer

@export var spawners_upgrade: ShopUpgrade
@export var spawner_handler: SpawnerHandler
@export var spawner_speed_upgrade: ShopUpgrade

@export var big_bubble_upgrade: ShopUpgrade
@export var huge_bubble_upgrade: ShopUpgrade

@export var swordfish_spawner: SwordfishSpawner
@export var swordfish_rate_upgrade: ShopUpgrade
@export var swordfish_speed_upgrade: ShopUpgrade

@export var money_mult_upgrade: ShopUpgrade

@export var click_power_upgrade: ShopUpgrade

@export var puffer_fish_upgrade: ShopUpgrade
@export var pufferfish: Bubblefish

func _ready():
	spawners_upgrade.set_cost_function(func(x: int): return round(20 + 10 * x ** 2.5))
	spawners_upgrade.set_upgrade_function(func(_x: int): spawner_handler.add_spawner())

	spawner_speed_upgrade.set_cost_function(func(x: int): return round(10 + 5 * x ** 2.5))
	spawner_speed_upgrade.set_upgrade_function(func(x: int): spawner_handler.update_spawner_times(2.0 - (x - 1) * 0.1))

	big_bubble_upgrade.set_cost_function(func(x: int): return 2 * (2 * x + 5) ** 2)
	big_bubble_upgrade.set_upgrade_function(func(_x: int): Global.big_bubble_rate += 0.05)

	huge_bubble_upgrade.set_cost_function(func(x: int): return round(4 * (2 * x + 5) ** 2.5))
	huge_bubble_upgrade.set_upgrade_function(func(_x: int): Global.huge_bubble_rate += 0.05)

	swordfish_rate_upgrade.set_cost_function(func(x: int): return 100 + 10 * x ** 3)
	swordfish_rate_upgrade.set_upgrade_function(func(x: int): swordfish_spawner.set_spawns_per_min(5.0 + 5 * x))

	swordfish_speed_upgrade.set_cost_function(func(x: int): return 50 + 5 * x ** 2)
	swordfish_speed_upgrade.set_upgrade_function(func(_x: int): Global.sword_fish_speed += 0.25)

	money_mult_upgrade.set_cost_function(func(x: int): return round(200 + 10 * (x + 1) ** 3))
	money_mult_upgrade.set_upgrade_function(func(_x: int): Global.money_multiplier += 0.1)

	click_power_upgrade.set_cost_function(func(x: int): return round(100 + 10 * x ** 2))
	click_power_upgrade.set_upgrade_function(func(_x: int): Global.click_power += 1.0)

	puffer_fish_upgrade.set_cost_function(func(x: int): return round(100 + 10 * x ** 3))
	puffer_fish_upgrade.set_upgrade_function(func(x):
		pufferfish.show()
		pufferfish.set_process_input(true)
		pufferfish.on_bubblefish_upgraded(3.0 + x * 1.0, 200 + x * 20, 1.0 + x * 0.1)
	)
