class_name Upgrades

# The prices for the next upgrades
@export var prices: Array
@export var level: int = 0

@export var unlockable: bool = false

# Real or arbitrary level cap
@export var level_cap: int

func _init() -> void:
    pass

# returns true if the upgrade can be unlocked at all. If not it should not be listed in the shop to begin with.
func can_be_unlocked() -> bool:
    return unlockable

func make_unlockable():
    self.unlockable = true

# returns true if the upgrade can be upgraded
func can_upgrade() -> bool:
    if (level + 1 < level_cap):
        return true
    else:
        # printerr("Upgrade level", level + 1, " not possible because it goes over the level cap for upgrade", self.get_class())
        return false
    
func buy_upgrade():
    level = level+1