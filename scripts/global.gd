extends Node

signal bubble_damaged(damage: float)
signal bubble_popped(points: float)

# Dictionary of upgrades
var upgrades: Dictionary = {
	"swordfish": null  # Placeholder for the SwordfishUpgrade instance
}

func _ready():
	# Manually create an instance of the SwordfishUpgrade script
	var swordfish_upgrade = load("res://scripts/Upgrades/swordfish_upgrade.gd").new()
	upgrades["swordfish"] = swordfish_upgrade


# returns all available upgrades. So all upgrades that can be unlocked or have been unlocked. Upgrades are still available even if their level cap is reached.
func get_available_upgrades():
	var res = []
	
	for u in self.upgrades:
		if u.can_be_unlocked():
			res.append(u)

	return res
