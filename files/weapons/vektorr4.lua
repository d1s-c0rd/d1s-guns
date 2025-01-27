--[[
Name: Vektor R4
It's an AK but it shoots 5.56x45MM. Also bigger magazines.
]]

-- getting reference to other weapons in case in we need to inherit some properties
local ar15 = weapons:getData("ar15")
-- instancing an empty table for our weapon
local weapon = {}
-- basic data
weapon.id = "vektorr4"
weapon.name = _T("WEAPON_NAME_VEKTOR_R5", "Vektor R5")
weapon.trivia = _T("WEAPON_NAME_VEKTOR_R5_TRIVIA",
    "South African license-manufactured copy of the Galil SAR 5.56x45MM carbine.")
weapon.price = 4500
weapon.type = weapons.TYPES.PRIMARY
weapon.category = weapons.CATEGORIES.RIFLE
weapon.NPC = true
weapon.unique = false
weapon.concealable = false
-- ammo
weapon.magSize = 35
weapon.ammoOnGive = weapon.magSize * 2
weapon.maxAmmo = weapon.magSize * 3
weapon.ammoType = "5.56x45MM"
weapon.ammoTypeList = ammo.list556x45MM
weapon.armorPenetration = ar15.armorPenetration
-- damage
weapon.damage = ar15.damage
weapon.damageMin = ar15.damageMin
weapon.rangeMin = ar15.rangeMin
weapon.rangeMax = ar15.rangeMax
-- stats
weapon.rateOfFire = 650
-- attachments
weapon.selectableMods = {{
    header = weapons.getModHeader("sight"),
    mods = {"reflex_sight", "scope_2x"}
}, {
    header = weapons.getModHeader("barrel"),
    mods = {"compensator", "suppressor_nonpistol"}
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
    header = weapons.getModHeader("magwell"),
    mods = {"flared_magwell"}
}, {
    header = weapons.getModHeader("handguard_rail"),
    mods = {"laser_pointer", "laser_pointer_ir"}
}, {
    header = weapons.getModHeader("handguard"),
    mods = {"foregrip"}
}, {
    header = weapons.getModHeader("grip"),
    mods = {"comfort_grip"}
}}
-- overriding the attachments modifier values for this particular weapon
weapon.modOverrides = {
    extended_magazine = {
        magSize = 15
    },
    smaller_magazine = {
        magSize = -15
    }
}
-- sounds
weapon.fireSound = ar15.fireSound
weapon.fireSuppressedSound = ar15.fireSuppressedSound
weapon.fireSubsonicSuppressedSound = ar15.fireSubsonicSuppressedSound
-- register and inherit missing properties
weapons:register(weapon, "ak47")
-- overrides
-- ammo
weapon.bulletSpeed = ar15.bulletSpeed
weapon.noiseRadius = ar15.noiseRadius
