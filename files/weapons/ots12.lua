--[[
Name: OTs-12 Tiss
I didn't want to make the Groza since it seemed too obvious of a choice given the presence of 9x39MM in the game, so I made an OTs-12 instead.
This one in particular is supposed to be a modern American-made civilian replica.
Stats-wise I tried to make it ever so slightly worse than the AS VAL as to not completely invalidate it.
]]

-- getting reference to other weapons in case in we need to inherit some properties
local ak47 = weapons:getData("ak47")
local asval = weapons:getData("asval")
-- instancing an empty table for our weapon
local weapon = {}
-- basic data
weapon.id = "ots12"
weapon.name = _T("WEAPON_NAME_OTS12", "OTs-12 Tiss")
weapon.trivia = _T("WEAPON_NAME_OTS12_TRIVIA",
    "Civilian replica of the forerunner to the more popular OTs-14 Groza, originally a modified AKS-74U rechambered in 9x39MM.\n\n\'Tiss\' means \'Yew Tree\'.")
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
weapon.bulletSpeed = 890
weapon.armorPenetration = 8
-- damage
weapon.damage = math.ceil(asval.damage * 0.95)
weapon.damageMin = math.ceil(asval.damageMin * 0.95)
weapon.rangeMin = asval.rangeMin
weapon.rangeMax = asval.rangeMax
-- stats
weapon.rateOfFire = 800
weapon.spread = asval.spread
weapon.shotDeviation = asval.shotDeviation * 1.08
weapon.focusSpread = ak47.focusSpread * 0.87
weapon.spreadDelay = asval.spreadDelay
weapon.spreadPerShot = 0.64 * 1.05
weapon.spreadPerShotMultiplier = asval.spreadPerShotMultiplier
weapon.spreadVelocityIncrease = asval.spreadVelocityIncrease * 1.05
weapon.spreadVelocityMax = asval.spreadVelocityMax
weapon.maxSpreadIncrease = asval.maxSpreadIncrease * 1.08
weapon.spreadDecrease = asval.spreadDecrease * 0.92
weapon.firemodes = {"semiauto"}
weapon.noiseRadius = 2600
weapon.noiseTravelOverride = false
weapon.noiseTravelOverrideSuppressed = noise.TRAVEL_GUNFIRE_SUPPRESSED_MID
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
    header = weapons.getModHeader("trigger_group"),
    mods = {"auto_trigger_group"}
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
        noiseRadius = -0.4
    }
}
weapon.modConflicts = {}
weapon.modIcons = ak47.modIcons
-- if there are extra mods compared to the base weapon we're going to inherit from we need to manually define their icons, or the game will crash when trying to applying them to the gun
weapon.modIcons.auto_trigger_group = weapon.modIcons.improved_trigger
-- sounds
weapon.fireSubsonicSuppressedSound = asval.fireSuppressedSound
-- register and inherit missing properties
weapons:register(weapon, "ak47")
