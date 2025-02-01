--[[
Name: SPAS-15
The better SPAS that unfortunately fell into obscurity. This was actually the very first new weapon I made.
]]

-- getting reference to other weapons in case in we need to inherit some properties
local saiga12k = weapons:getData("saiga12k")
local ar15 = weapons:getData("ar15")
-- instancing an empty table for our weapon
local weapon = {}
-- basic data
weapon.id = "spas15"
weapon.name = _T("WEAPON_NAME_SPAS15", "SPAS-15")
weapon.trivia = _T("WEAPON_NAME_SPAS15_TRIVIA",
    "A further development of the SPAS-12, it retains the dual pump-action/semi-auto firing modes but uses detachable magazines instead of a traditional internal magazine tube.")
weapon.price = 7500
weapon.type = weapons.TYPES.PRIMARY
weapon.category = weapons.CATEGORIES.SHOTGUN
weapon.NPC = true
weapon.unique = false
weapon.concealable = false
-- ammo
weapon.magSize = 6
weapon.ammoOnGive = weapon.magSize * 2
weapon.maxAmmo = 24
-- stats
weapon.rateOfFire = 450
weapon.firemodes = {"semiauto"}
-- attachments
weapon.selectableMods = {{
    header = weapons.getModHeader("sight"),
    mods = {"reflex_sight"}
}, {
    header = weapons.getModHeader("barrel_type"),
    mods = {"extended_barrel"}
}, {
    header = weapons.getModHeader("barrel"),
    mods = {"duckbill", "choke", "compensator", "suppressor_nonpistol"}
}, {
    header = weapons.getModHeader("magazine"),
    mods = {"extended_magazine", "smaller_magazine"}
}, {
    header = weapons.getModHeader("spring"),
    mods = {"heavy_spring", "light_spring"}
}, {
    header = weapons.getModHeader("stock"),
    mods = {"customfit_stock", "lightweight_stock"}
}, {
    header = weapons.getModHeader("trigger"),
    mods = {"improved_trigger"}
}, {
    header = weapons.getModHeader("trigger_group"),
    mods = {"auto_trigger_group"}
}, {
    header = weapons.getModHeader("magwell"),
    mods = {"flared_magwell"}
}, {
    header = weapons.getModHeader("handguard_rail"),
    mods = {"laser_pointer", "laser_pointer_ir"}
}, {
    header = weapons.getModHeader("grip"),
    mods = {"comfort_grip"}
}}
weapon.modRequirements = {
    auto_trigger_group = {"improved_trigger"}
}
-- overriding the attachments modifier values for this particular weapon
weapon.modOverrides = {
    extended_magazine = {
        magSize = 4
    },
    smaller_magazine = {
        magSize = -3
    }
}
weapon.modConflicts = {}
weapon.modIcons = saiga12k.modIcons
-- if there are extra mods compared to the base weapon we're going to inherit from then we need to manually define their icons or else the game will crash when trying to applying the mods to the gun
weapon.modIcons.extended_magazine = saiga12k.modIcons.drum_magazine
-- sprites
weapon.worldSprite = ar15.worldSprite
weapon.worldScale = ar15.worldScale
-- register and inherit missing properties
weapons:register(weapon, "saiga12k")
-- overrides
weapon.bulletSpeed = saiga12k.bulletSpeed
weapon.spreadPerShot = saiga12k.spreadPerShot
-- override achievement check method just in case
weapon._verifyWeaponModAchievements = nil
