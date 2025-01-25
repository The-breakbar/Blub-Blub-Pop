extends Node

signal bubble_damaged()
signal bubble_popped(points)

# An array of all existing upgrades
var upgrades: Dictionary = {
    "swordfish": swordfish_upgrade
}

# returns all available upgrades. So all upgrades that can be unlocked or have been unlocked. Upgrades are still available even if their level cap is reached.
func get_available_upgrades():
    var res = []
    
    for u in self.upgrades:
        if u.can_be_unlocked():
            res.append(u)

    return res