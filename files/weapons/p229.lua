--[[
Name: P229
Made this as an excuse to add a pistol with a .357 SIG conversion. It also has a 9x19MM conversion for completeness sake.
]]

-- getting reference to other weapons in case in we need to inherit some properties
local hs2000 = weapons:getData("hs2000")
local p89 = weapons:getData("p89")
-- instancing an empty table for our weapon
local weapon = {}
-- basic data
weapon.id = "p229"
weapon.name = _T("WEAPON_NAME_P229", "P229")
weapon.trivia = _T("WEAPON_NAME_P229_TRIVIA", "Compact variant of the P226.")
weapon.price = 900
weapon.type = weapons.TYPES.SECONDARY
weapon.category = weapons.CATEGORIES.HANDGUN
weapon.NPC = true
weapon.unique = false
weapon.concealable = true
-- ammo
weapon.magSize = 10
weapon.ammoOnGive = weapon.magSize * 2
weapon.maxAmmo = weapon.magSize * 3
weapon.ammoType = "40SW"
weapon.ammoTypeList = ammo.list40SW
weapon.armorPenetration = 4
-- damage
weapon.damage = hs2000.damage
weapon.damageMin = hs2000.damageMin
weapon.rangeMin = hs2000.rangeMin
weapon.rangeMax = hs2000.rangeMax
-- stats
weapon.shotDeviation = 1.4
weapon.spreadDelay = hs2000.spreadDelay
-- copied from hs2000
weapon.spreadPerShot = 0.55
weapon.spreadPerShotMultiplier = hs2000.spreadPerShotMultiplier
weapon.spreadVelocityIncrease = hs2000.spreadVelocityIncrease
weapon.spreadVelocityMax = hs2000.spreadVelocityMax
weapon.maxSpreadIncrease = hs2000.maxSpreadIncrease
weapon.spreadDecrease = hs2000.spreadDecrease
-- attachments
weapon.selectableMods = {{
    header = weapons.getModHeader("sight"),
    mods = {"glow_sights", "reflex_sight_pistol"}
}, {
    header = weapons.getModHeader("barrel_type"),
    mods = {"threaded_barrel", "match_barrel", "threaded_match_barrel"}
}, {
    header = weapons.getModHeader("barrel"),
    mods = {"compensator", "suppressor_pistol_lp", "suppressor_pistol", "suppressor_pistol_manual"}
}, {
    header = weapons.getModHeader("trigger"),
    mods = {"improved_trigger", "binary_trigger"}
}, {
    header = weapons.getModHeader("trigger_group"),
    mods = {"burst_trigger_group"}
}, {
    header = weapons.getModHeader("magwell"),
    mods = {"flared_magwell"}
}, {
    header = weapons.getModHeader("magazine"),
    mods = {"extended_magazine", "9mm_magazine", "357sig_magazine"}
}, {
    header = weapons.getModHeader("bottom_rail"),
    mods = {"laser_pointer", "laser_pointer_ir"}
}, {
    header = weapons.getModHeader("grip"),
    mods = {"comfort_grip"}
}}
-- overriding the attachments modifier values for this particular weapon
weapon.modOverrides = {
    extended_magazine = {
        magSize = 4
    },
    ["9mm_magazine"] = {
        magSize = 7,
        damage = -0.12,
        damageMin = -0.12
    },
    ["357sig_magazine"] = {
        magSize = 2
    }
}
weapon.modIcons = p89.modIcons
-- if there are extra mods compared to the base weapon we're going to inherit from then we need to manually define their icons or else the game will crash when trying to applying the mods to the gun
weapon.modIcons["9mm_magazine"] = p89.modIcons.smaller_magazine
weapon.modIcons["357sig_magazine"] = p89.modIcons.smaller_magazine
-- register and inherit missing properties
weapons:register(weapon, "p89")
-- overrides
weapon.bulletSpeed = hs2000.bulletSpeed
