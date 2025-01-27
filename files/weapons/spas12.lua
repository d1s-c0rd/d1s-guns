--[[
Name: SPAS-12
After I made the SPAS-15 I just had to make this too.
]]

local wepBase = weapons:getData("base_weapon")
local m1014 = weapons:getData("m1014")
local remington_870 = weapons:getData("remington_870")

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
weapon.spreadPerShot = 1.8
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
weapon.modIcons.smaller_magazine = {
    active = "m1014_mods_9",
    idle = "m1014_mods_28",
    hover = "m1014_mods_47",
    align = gui.SIDES.RIGHT
}
-- sprites
weapon.worldSprite = remington_870.worldSprite
weapon.worldScale = remington_870.worldScale
weapon.uiIcon = remington_870.uiIcon
weapon.uiIconInactive = remington_870.uiIconInactive
weapon.uiIconIdle = remington_870.uiIconIdle
-- register and inherit missing properties
weapons:register(weapon, "m1014")
-- override achievement check method just in case
weapon._verifyWeaponModAchievements = nil
