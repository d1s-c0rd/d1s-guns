-- instancing an empty table for the new weapon mod
local mod = {};
-- unique ID of the weapon mod
mod.id = "50bmg_magazine"
-- price of the weapon mod
mod.price = 5000
-- name of the weapon mod
mod.name = _T("WEAPON_MOD_50BMG_CALIBER_CONVERSION_SHORT", ".50 BMG Cal.")
-- full name of the weapon mod shown when hovering it in the loadout screen (optional)
mod.nameFull = _T("WEAPON_MOD_50BMG_CALIBER_CONVERSION_FULL", ".50 BMG Caliber conversion")
-- list of descriptions to add to the stats list shown when hovering the weapon mod in the loadout screen (optional)
-- second parameter is a boolean that defines whether the description should be shown on top of the positives (green) or negatives (red)
mod.description = {{_T("WEAPON_MOD_50BMG_CALIBER_CONVERSION_DESC", "Converts the weapon to use the .50 BMG caliber."),
                    true}}
-- variable used in internal logic of 10mm_magazine.lua to handle caliber swap
-- simply set it to the ammo list you want to use and inherit an already existing caliber conversion mod
mod.ammoList = ammo.list50BMG
-- values applied to the weapon when the mod is installed
mod.valueMods = {{"armorPenetration", 0, "+"}, {"bulletSpeed", 0.1}, {"damage", 0.75}, {"damageMin", 0.75},
                 {"magSize", 0, "+"}, {"maxSpreadIncrease", 0.6}, {"noiseChange", 0, "+"}, {"noiseRadius", 0.64},
                 {"reloadSpeedMultiplier", 0.5}, {"shotDelay", 0}, {"shotDeviation", -0.05}, {"slowdown", 0.03, "+"},
                 {"spreadPerShot", 0.6}, {"spreadPerShotMultiplier", 0.6}}
-- should the mod be unlocked for all weapons when purchased?
mod.universalUnlock = false
-- is the mod needed to be purchased to unlock the Gun Schizo achievement?
mod.countForGunSchizo = false
-- register and inherit missing properties
weapons.registerWeaponMod(mod, "10mm_magazine")

-- overriding the onAdded and onRemoved methods from 10mm_magazine to adjust the ammoOnGive value
-- this will halve the amount of reserve ammo given from the loadout screen from 20 to 10 for the R700
function mod:onAdded(wep)
    local origWep = weapons:getData(wep:getID())
    -- overriding ammoOnGive value by halving it
    wep.ammoOnGive = math.floor(origWep.ammoOnGive / 2)
    wep:setAmmoTypeList(self.ammoList)
    self:onCaliberChanged(wep)
end

function mod:onRemoved(wep)
    local origWep = weapons:getData(wep:getID())
    -- restoring original ammoOnGive value
    wep.ammoOnGive = origWep.ammoOnGive
    wep:setAmmoTypeList()
    self:onCaliberChanged(wep)
end
