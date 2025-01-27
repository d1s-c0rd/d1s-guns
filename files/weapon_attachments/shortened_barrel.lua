-- instancing an empty table for the new weapon mod
local mod = {}
-- unique ID of the weapon mod
mod.id = "shortened_barrel"
-- price of the weapon mod
mod.price = 250
-- name of the weapon mod
mod.name = _T("WEAPON_MOD_SHORTENED_BARREL", "Short. barrel")
-- full name of the weapon mod shown when hovering it in the loadout screen (optional)
mod.nameFull = _T("WEAPON_MOD_SHORTENED_BARREL_FULL", "Shortened barrel")
-- list of descriptions to add to the stats list shown when hovering the weapon mod in the loadout screen (optional)
-- second parameter is a boolean that defines whether the description should be shown on top of the positives (green) or negatives (red)
mod.description = {}
-- values applied to the weapon when the mod is installed
mod.valueMods = {{"bulletSpeed", -0.15}, {"clumpSpread", 0.1}, {"shotDeviation", 0.1}, {"damage", -0.1},
                 {"damageMin", -0.1}, {"lookSpreadAngleMultiplier", -0.1}, {"noiseChange", -0.02, "+"},
                 {"slowdown", -0.003, "+"}, {"focusSpread", -0.1}, {"focusSpreadSpeed", 0.1}, {"spreadPerShot", 0.02},
                 {"maxSpreadIncrease", 0.05}, {"spreadVelocityIncrease", 0.1}}
-- should the mod be unlocked for all weapons when purchased?
mod.universalUnlock = false
-- is the mod needed to be purchased to unlock the Gun Schizo achievement?
mod.countForGunSchizo = false
-- register and inherit missing properties
weapons.registerWeaponMod(mod, "base_weapon_mod")
