extends Upgrades
class_name SwordfishUpgrade

var damage: float
var min_time: float = 10.0
var max_time: float = 20.0

signal swordfish_upgraded(damage: float, min_time: float, max_time: float)

func _init():
    self.prices = [10, 50, 100, 500, 1000]
    self.level_cap = 5

func buy_upgrade():
    if !self.can_upgrade():
        return

    self.damage = self.damage + 1
    self.min_time = self.min_time - (self.min_tim / 1.5)
    self.max_time = self.max_time - (self.max_time / 1.5)

    emit_signal("swordfish_upgraded", self.damage, self.min_time, self.max_time)

    super.buy_upgrade()
    