--[[
Name: OTs-14 Groza
I ended up making a Groza anyway. Pretty much just the AS VAL, more noisy but with slightly better stats once you attach a suppressor.
]]

-- getting reference to other weapons in case in we need to inherit some properties
local famas = weapons:getData("famas")
local asval = weapons:getData("asval")
-- instancing an empty table for our weapon
local weapon = {}
-- basic data
weapon.id = "ots14"
weapon.name = _T("WEAPON_NAME_OTS14", "OTs-14 Groza")
weapon.trivia = _T("WEAPON_NAME_OTS14_TRIVIA",
    "Bullpup assault rifle designed for close quarters and stealth operations.\n\n\'Groza\' means \'Storm\'")
weapon.price = 8500
weapon.type = weapons.TYPES.PRIMARY
weapon.category = weapons.CATEGORIES.RIFLE
weapon.NPC = true
weapon.unique = false
weapon.concealable = false
-- ammo
weapon.magSize = 20
weapon.ammoOnGive = weapon.magSize * 2
weapon.maxAmmo = weapon.magSize * 3
weapon.ammoType = "9x39MM"
weapon.ammoTypeList = false
weapon.bulletSpeed = 980
weapon.armorPenetration = 8
-- damage
weapon.damage = math.ceil(asval.damage * 0.95)
weapon.damageMin = math.ceil(asval.damageMin * 0.95)
weapon.rangeMin = asval.rangeMin
weapon.rangeMax = asval.rangeMax
-- stats
weapon.rateOfFire = 750
weapon.spread = asval.spread
weapon.shotDeviation = asval.shotDeviation
weapon.focusSpread = asval.focusSpread
weapon.spreadDelay = asval.spreadDelay
-- copied from asval
weapon.spreadPerShot = 0.64
weapon.spreadPerShotMultiplier = asval.spreadPerShotMultiplier
weapon.spreadVelocityIncrease = asval.spreadVelocityIncrease
weapon.spreadVelocityMax = asval.spreadVelocityMax
weapon.maxSpreadIncrease = asval.maxSpreadIncrease
weapon.spreadDecrease = asval.spreadDecrease
weapon.firemodes = {"fullauto", "semiauto"}
weapon.noiseRadius = 2600
weapon.noiseTravelOverride = false
weapon.noiseTravelOverrideSuppressed = noise.TRAVEL_GUNFIRE_SUPPRESSED_MID
-- attachments
weapon.selectableMods = {{
    header = weapons.getModHeader("sight"),
    mods = {"reflex_sight", "scope_4x"}
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
        magSize = 10
    },
    smaller_magazine = {
        magSize = -10
    },
    suppressor_nonpistol = {
        noiseRadius = -0.4
    }
}
weapon.modConflicts = {}
weapon.modIcons = famas.modIcons
-- if there are extra mods compared to the base weapon we're going to inherit from then we need to manually define their icons or else the game will crash when trying to applying the mods to the gun
weapon.modIcons.scope_4x = weapon.modIcons.scope_2x
-- sounds
weapon.fireSubsonicSuppressedSound = asval.fireSuppressedSound
-- register and inherit missing properties
weapons:register(weapon, "famas")
