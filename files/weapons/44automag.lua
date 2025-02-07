--[[
Name: .44 Auto Mag Pistol
Added to have a semi-automatic chambered in .44 Magnum. Couldn't be bothered to add a .44 AMP ammo type exclusively for this.
]]

-- getting reference to other weapons in case in we need to inherit some properties
local revolver = weapons:getData("revolver")
local deagle = weapons:getData("deagle")
local mk4 = weapons:getData("mk4")

-- instancing an empty table for the new weapon
local weapon = {}
-- basic data
weapon.id = "44automag"
weapon.name = _T("WEAPON_NAME_44AUTOMAG", ".44 Auto Mag Pistol")
weapon.trivia = _T("WEAPON_NAME_44AUTOMAG_TRIVIA",
    "A rare big bore semi-automatic pistol using a rotary bolt with six locking lugs.")
weapon.price = 5500
weapon.type = weapons.TYPES.SECONDARY
weapon.category = weapons.CATEGORIES.HANDGUN
weapon.NPC = true
weapon.unique = false
weapon.concealable = true
-- ammo
weapon.magSize = 7
weapon.ammoOnGive = weapon.magSize * 2
weapon.maxAmmo = weapon.magSize * 3
weapon.ammoType = "44MAGNUM"
weapon.ammoTypeList = false
weapon.armorPenetration = deagle.armorPenetration
weapon.magType = deagle.magType
weapon.magazinePrefabID = deagle.magazinePrefabID
-- damage
weapon.damage = revolver.damage
weapon.damageMin = revolver.damageMin
weapon.rangeMin = revolver.rangeMin
weapon.rangeMax = revolver.rangeMax
-- stats
weapon.shotDeviation = deagle.shotDeviation
weapon.spread = deagle.spread
weapon.focusSpread = deagle.focusSpread
weapon.focusSpreadSpeed = deagle.focusSpreadSpeed
weapon.spreadDelay = deagle.spreadDelay
weapon.spreadPerShotMultiplier = deagle.spreadPerShotMultiplier
weapon.spreadPerShotMultiplierPlayer = deagle.spreadPerShotMultiplierPlayer
weapon.spreadVelocityIncrease = deagle.spreadVelocityIncrease
weapon.spreadVelocityMax = deagle.spreadVelocityMax
weapon.maxSpreadIncrease = deagle.maxSpreadIncrease
weapon.spreadDecrease = deagle.spreadDecrease
weapon.rateOfFire = deagle.rateOfFire
weapon.ricochetTimes = deagle.ricochetTimes
weapon.hitParticleRange = deagle.hitParticleRange
weapon.bulletColor = revolver.bulletColor
weapon.vibration = deagle.vibration
-- attachments
weapon.selectableMods = {
    {
		header = weapons.getModHeader("sight"),
		mods = {
			"glow_sights"
		}
	},
	{
		header = weapons.getModHeader("barrel_type"),
		mods = {
			"match_barrel",
			"extended_barrel"
		}
	},
	{
		header = weapons.getModHeader("spring"),
		mods = {
			"light_spring"
		}
	},
	{
		header = weapons.getModHeader("trigger"),
		mods = {
			"improved_trigger"
		}
	},
	{
		header = weapons.getModHeader("magwell"),
		mods = {
			"flared_magwell"
		}
	},
	{
		header = weapons.getModHeader("magazine"),
		mods = {
			"extended_magazine"
		}
	},
	{
		header = weapons.getModHeader("grip"),
		mods = {
			"comfort_grip"
		}
	}
}
weapon.modRequirements = {}
weapon.modConflicts = {}
weapon.modOverrides = {
    extended_magazine = {
        magSize = 2
    }
}
weapon.modIcons = mk4.modIcons
weapon.modIcons.match_barrel = mk4.modIcons.threaded_barrel
weapon.modIcons.extended_barrel = mk4.modIcons.suppressor_pistol
weapon.modIcons.light_spring = mk4.modIcons.auto_trigger_group
-- sound
weapon.fireSound = revolver.fireSound
-- register and inherit missing properties
weapons:register(weapon, "mk4")
-- overrides
weapon.bulletSpeed = revolver.bulletSpeed
weapon.spreadPerShot = deagle.spreadPerShot
weapon.noiseRadius = deagle.noiseRadius
