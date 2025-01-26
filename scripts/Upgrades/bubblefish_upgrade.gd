extends Upgrades
class_name BubblefishUpgrade

var damage: float
var speed: float
var size: float

signal bubblefish_upgraded(damage: float, speed: float, size: float)
signal bubblefish_spawned(damage: float, speed: float, size: float)

func _init():
    self.level_cap = 10
    self.prices = [50, 100, 200, 500, 1000, 2000, 5000, 10000, 20000, 50000]


func buy_upgrade():
    if self.level == 0:
        self.damage = 3
        self.speed = 200
        self.size = 1
        emit_signal("bubblefish_spawned", self.damage, self.speed, self.size)

    if !self.can_upgrade():
        return

    self.damage = self.damage * 2
    self.speed = self.speed + 10
    self.size = self.size * 1.1

    emit_signal("bubblefish_upgraded", self.damage, self.speed, self.size)

    super.buy_upgrade()