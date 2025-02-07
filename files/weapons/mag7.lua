--[[
Name: MAG-7
Conceable shotgun that isn't a sawn-off
]]

-- getting reference to other weapons in case in we need to inherit some properties
local mini_uzi = weapons:getData("mini_uzi")
local sawnOff = weapons:getData("sawn_off_shotgun")
local auto5 = weapons:getData("auto5")
local goon = actor.getClassData("goon")
local magClass = objects.getClassData("dropped_mag")
-- instancing magazine class
magClass:registerPrefab({
	pickupSound = "interaction_pickup_mag_rifle",
	id = "mag_mag7",
	weight = 0.7,
	impactSound = "impact_mag_rifle",
	quad = "magazine_uzi",
	sizeFromQuad = true,
	name = _T("ENTITY_SHOTGUN_MAGAZINE", "Empty shotgun mag"),
	noiseType = noise.SOUND_TYPES.FOLEY
})

-- instancing an empty table for the new weapon
local weapon = {}
-- basic data
weapon.id = "mag7"
weapon.name = _T("WEAPON_NAME_MAG7", "MAG-7")
weapon.trivia = _T("WEAPON_NAME_MAG7_TRIVIA",
    "South African pump-action shotgun with a shape reminiscent of a submachine gun. Due to the need to make the magazine fit in the pistol grip it uses shorter 12 gauge shells, reducing its effectiveness.")
weapon.price = 800
weapon.type = weapons.TYPES.PRIMARY
weapon.category = weapons.CATEGORIES.SHOTGUN
weapon.NPC = true
weapon.unique = false
weapon.concealable = true
weapon.SHOTGUN = true
-- ammo
weapon.magSize = 5
weapon.ammoOnGive = weapon.magSize * 4
weapon.maxAmmo = weapon.magSize * 5
weapon.ammoType = "12G"
weapon.ammoTypeList = ammo.list12G
weapon.armorPenetration = sawnOff.armorPenetration
weapon.casingConfig = sawnOff.casingConfig
weapon.bulletColor = sawnOff.bulletColor
weapon.shots = sawnOff.shots
weapon.chamberAmount = 1
weapon.magazinePrefabID = "mag_mag7"
-- damage
weapon.damage = 10
weapon.damageMin = 4
weapon.gibDamage = 25
weapon.rangeMin = sawnOff.rangeMin
weapon.rangeMax = sawnOff.rangeMax
-- stats
weapon.spread = auto5.spread * 1.5
weapon.spreadPerShotMultiplier = auto5.spreadPerShotMultiplier
weapon.spreadPerShotMultiplierPlayer = auto5.spreadPerShotMultiplierPlayer
weapon.spreadVelocityIncrease = sawnOff.spreadVelocityIncrease
weapon.spreadVelocityMax = sawnOff.spreadVelocityMax
weapon.maxSpreadIncrease = auto5.maxSpreadIncrease
weapon.spreadDecrease = auto5.spreadDecrease
weapon.shotDeviation = auto5.shotDeviation * 1.5
weapon.focusSpread = auto5.focusSpread * 1.5
weapon.spreadDelay = sawnOff.spreadDelay
weapon.clumpSpread = sawnOff.clumpSpread
weapon.firemodes = {"pumpaction"}
weapon.rateOfFire = 200
weapon.ricochetTimes = sawnOff.ricochetTimes
weapon.vibration = sawnOff.vibration
weapon.noiseChange = sawnOff.noiseChange
weapon.slowdown = sawnOff.slowdown
weapon.hitParticleRange = sawnOff.hitParticleRange
-- attachments
weapon.selectableMods = {{
    header = weapons.getModHeader("sight"),
    mods = {"reflex_sight"}
}, {
    header = weapons.getModHeader("barrel"),
    mods = {"duckbill", "choke", "compensator", "extended_barrel", "suppressor_nonpistol"}
}, {
    header = weapons.getModHeader("magazine"),
    mods = {"extended_magazine"}
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
    header = weapons.getModHeader("grip"),
    mods = {"comfort_grip"}
}}
weapon.modRequirements = {}
-- overriding the attachments modifier values for this particular weapon
weapon.modOverrides = {
    extended_magazine = {
        magSize = 2
    }
}
weapon.modConflicts = {}
weapon.modIcons = mini_uzi.modIcons
weapon.modIcons.duckbill = mini_uzi.modIcons.compensator
weapon.modIcons.choke = mini_uzi.modIcons.compensator
-- sounds
weapon.lowAmmoSound = auto5.lowAmmoSound
weapon.fireSound = auto5.fireSound
weapon.fireSuppressedSound = auto5.fireSuppressedSound
weapon.emptySound = auto5.emptySound
weapon.deploySound = auto5.deploySound
weapon.deployFoley = auto5.deployFoley
-- register and inherit missing properties
weapons:register(weapon, "mini_uzi")
-- overrides
weapon.spreadPerShot =  sawnOff.spreadPerShot
weapon.bulletSpeed = sawnOff.bulletSpeed
weapon.noiseRadius = sawnOff.noiseRadius
weapon.aiSpread = sawnOff.aiSpread
weapon.aiFiringFrequency = {
	[goon.EXPERIENCE_LEVELS.GREEN] = {
		distanceStart = 600,
		max = 0.8,
		min = 0.5,
		distanceFinish = 1000
	},
	[goon.EXPERIENCE_LEVELS.EXPERIENCED] = {
		distanceStart = 500,
		max = 0.7,
		min = 0.45,
		distanceFinish = 900
	},
	[goon.EXPERIENCE_LEVELS.ELITE] = {
		distanceStart = 400,
		max = 0.6,
		min = 0.35,
		distanceFinish = 800
	}
}

--methods
weapon.getBulletAngle = sawnOff.getBulletAngle

function weapon:onKilledActor(victim, attacker)
	weapon.baseClass.onKilledActor(self, victim, attacker)
	events:fire(weapons.EVENTS.SHOTGUN_KILL, self, victim, attacker)
end