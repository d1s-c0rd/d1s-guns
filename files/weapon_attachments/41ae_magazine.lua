-- instancing an empty table for the new weapon mod
local mod = {}
-- unique ID of the weapon mod
mod.id = "41ae_magazine"
-- price of the weapon mod
mod.price = 2500
-- name of the weapon mod
mod.name = _T("WEAPON_MOD_41AE_CALIBER_CONVERSION_SHORT", ".41 AE Cal.")
-- full name of the weapon mod shown when hovering it in the loadout screen (optional)
mod.nameFull = _T("WEAPON_MOD_41AE_CALIBER_CONVERSION_FULL", ".41 AE Caliber conversion")
-- list of descriptions to add to the stats list shown when hovering the weapon mod in the loadout screen (optional)
-- second parameter is a boolean that defines whether the description should be shown on top of the positives (green) or negatives (red)
mod.description = {{_T("WEAPON_MOD_41AE_CALIBER_CONVERSION_DESC", "Converts the weapon to use the .41 AE caliber."),
                    true}}
-- variable used in internal logic of 10mm_magazine.lua to handle caliber swap
-- simply set it to the ammo list you want to use and inherit an already existing caliber conversion mod
mod.ammoList = ammo.list41AE
-- values applied to the weapon when the mod is installed
mod.valueMods = {{"shotDeviation", -0.05}, {"spreadPerShotMultiplier", 0.1}, {"bulletSpeed", -0.2}, {"damage", 0.2},
                 {"damageMin", 0.2}, {"spreadPerShot", 0.15}, {"maxSpreadIncrease", 0.2}, {"magSize", 0, "+"}}
-- should the mod be unlocked for all weapons when purchased?
mod.universalUnlock = false
-- is the mod needed to be purchased to unlock the Gun Schizo achievement?
mod.countForGunSchizo = false
-- register and inherit missing properties
weapons.registerWeaponMod(mod, "10mm_magazine")
