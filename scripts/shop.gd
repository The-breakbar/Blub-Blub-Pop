extends VBoxContainer

@export var spawners_upgrade: ShopUpgrade
@export var spawner_handler: SpawnerHandler

func _ready():
	spawners_upgrade.set_cost_function(func(x: int): return 50 + 10 * (x) ** 3)
	spawners_upgrade.set_upgrade_function(func(_x: int): spawner_handler.add_spawner())
