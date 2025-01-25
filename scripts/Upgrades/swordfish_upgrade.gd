extends Upgrades
class_name swordfish_upgrade

@export var damage: float

func _init():
    self.prices = [10, 50, 100, 500, 1000]
    self.level_cap = 5

func buy_upgrade():
    if !self.can_upgrade():
        return
    super.buy_upgrade()
    