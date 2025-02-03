--[[
Name: LC Charger
The poor man's MP7. "Poor man" because by the time you've made it into an actual PDW you could've just bought the MP7 for less.
This weapon was made to demonstrate DLC checks.
]]

-- getting reference to other weapons in case in we need to inherit some properties
local p90 = weapons:getData("p90")
local mp7 = weapons:getData("mp7")
local glock20 = weapons:getData("glock20")

-- instancing an empty table for the new weapon
local weapon = {}
-- basic data
weapon.id = "lccharger"
weapon.name = _T("WEAPON_NAME_LCCHARGER", "LC Charger")
weapon.trivia = _T("WEAPON_NAME_LCCHARGER_TRIVIA",
    "An oversized pistol chambered in 5.7x28MM, with some work put into it it might resemble a PDW.\n\nThe MP7 at home.")
weapon.price = 1500
weapon.type = weapons.TYPES.PRIMARY
weapon.category = weapons.CATEGORIES.SMG
weapon.NPC = true
weapon.unique = false
weapon.concealable = true
-- ammo
weapon.magSize = 20
weapon.ammoOnGive = weapon.magSize * 2
weapon.maxAmmo = weapon.magSize * 3
-- damage
weapon.damage = 28
weapon.damageMin = 25
-- stats
weapon.firemodes = {"semiauto"}
weapon.rateOfFire = 750
-- attachments
weapon.selectableMods = {{
    header = weapons.getModHeader("sight"),
    mods = {"reflex_sight", "scope_2x"}
}, {
    header = weapons.getModHeader("barrel"),
    mods = {"extended_barrel", "compensator", "suppressor_nonpistol"}
}, {
    header = weapons.getModHeader("magazine"),
    mods = {"extended_magazine", "smaller_magazine", "10mm_magazine"}
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
        magSize = 10
    },
    smaller_magazine = {
        magSize = -10
    },
    suppressor_nonpistol = {
        noiseRadius = -0.15
    },
    ["10mm_magazine"] = {
        magSize = 10,
        damage = 0.4,
        damageMin = 0.4
    }
}
weapon.modConflicts = {}
weapon.modIcons = mp7.modIcons
weapon.modIcons.auto_trigger_group = mp7.modIcons.improved_trigger
weapon.modIcons["10mm_magazine"] = mp7.modIcons.extended_magazine
-- register and inherit missing properties
weapons:register(weapon, "mp7")
-- very crude DLC check: if P90 weapon data exists then inherit some properties from it, else inherit from MP7 as fallback
if p90 then
    -- ammo
    -- 5.7x28MM ammo is defined in the supporter DLC, so it can only be used if the DLC is present
    weapon.ammoType = "5.7x28MM"
    weapon.ammoTypeList = ammo.list57x28MM
    -- sounds
    weapon.fireSound = p90.fireSound
    weapon.fireSuppressedSound = p90.fireSuppressedSound
    weapon.fireSubsonicSuppressedSound = p90.fireSubsonicSuppressedSound
    -- overrides
    weapon.bulletSpeed = p90.bulletSpeed
    weapon.spreadPerShot = p90.spreadPerShot
else
    -- overrides
    weapon.bulletSpeed = mp7.bulletSpeed
    weapon.spreadPerShot = mp7.spreadPerShot
end

-- method for handling firing sound when the 10mm caliber conversion mod is installed
function weapon:getFireSound()
    if self:isModActive("10mm_magazine") then
        if self:isModActive("suppressor_nonpistol") then
            return glock20.fireSuppressedSound
        end
        return glock20.fireSound
    end
    return self._fireSound
end
