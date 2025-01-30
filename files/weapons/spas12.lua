--[[
Name: SPAS-12
After I made the SPAS-15 I just had to make this too.
]]

-- getting reference to other weapons in case in we need to inherit some properties
local m1014 = weapons:getData("m1014")
local remington_870 = weapons:getData("remington_870")
-- instancing an empty table for our weapon
local weapon = {}
-- basic data
weapon.id = "spas12"
weapon.name = _T("WEAPON_NAME_SPAS12", "SPAS-12")
weapon.trivia = _T("WEAPON_NAME_SPAS12_TRIVIA",
    "Combat shotgun for military and police applications with dual pump-action/semi-auto firing modes.\n\nLooks really mean.")
weapon.price = 8500
weapon.type = weapons.TYPES.PRIMARY
weapon.category = weapons.CATEGORIES.SHOTGUN
weapon.NPC = true
weapon.unique = false
weapon.concealable = false
-- ammo
weapon.magSize = 6
weapon.ammoOnGive = weapon.magSize * 4
weapon.maxAmmo = 25
-- stats
weapon.rateOfFire = 350
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
    header = weapons.getModHeader("stock"),
    mods = {"customfit_stock", "lightweight_stock"}
}, {
    header = weapons.getModHeader("trigger"),
    mods = {"improved_trigger"}
}, {
    header = weapons.getModHeader("trigger_group"),
    mods = {"burst_trigger_group"}
}, {
    header = weapons.getModHeader("handguard_rail"),
    mods = {"laser_pointer", "laser_pointer_ir"}
}, {
    header = weapons.getModHeader("grip"),
    mods = {"comfort_grip"}
}}
weapon.modRequirements = {
    burst_trigger_group = {"improved_trigger"}
}
-- overriding the attachments modifier values for this particular weapon
weapon.modOverrides = {
    extended_magazine = {
        magSize = 2
    },
    smaller_magazine = {
        magSize = -1
    }
}
weapon.modConflicts = {}
weapon.modIcons = m1014.modIcons
-- if there are extra mods compared to the base weapon we're going to inherit from then we need to manually define their icons or else the game will crash when trying to applying the mods to the gun
weapon.modIcons.smaller_magazine = m1014.modIcons.extended_magazine
-- sprites
weapon.worldSprite = remington_870.worldSprite
weapon.worldScale = remington_870.worldScale
weapon.uiIcon = remington_870.uiIcon
weapon.uiIconInactive = remington_870.uiIconInactive
weapon.uiIconIdle = remington_870.uiIconIdle
-- register and inherit missing properties
weapons:register(weapon, "m1014")
-- overrides
weapon.bulletSpeed = m1014.bulletSpeed
weapon.spreadPerShot = m1014.spreadPerShot
-- override achievement check method just in case
weapon._verifyWeaponModAchievements = nil
