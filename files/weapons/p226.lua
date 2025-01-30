--[[
Name: P226
A basic bitch copy of an already existing gun. Doesn't get much simpler than this to make a new gun.
]]

-- getting reference to other weapons in case in we need to inherit some properties
local p89 = weapons:getData("p89")

-- instancing an empty table for the new weapon
local weapon = {}
-- basic data
-- unique ID of the weapon
weapon.id = "p226"
-- display name
weapon.name = _T("WEAPON_NAME_P226", "P226")
-- description displayed when hovering the gun in the loadout selection screen
weapon.trivia = _T("WEAPON_NAME_P226_TRIVIA",
    "A Swiss-German Wonder Nine, popular among law enforcement and military units worldwide.")
-- price of the weapon
weapon.price = 800
-- which slot it occupies and which skills influence it
weapon.type = weapons.TYPES.SECONDARY
-- which category should be used to filter it in the loadout selection screen
-- IMPORTANT: without this property the gun will not appear in the loadout screen
weapon.category = weapons.CATEGORIES.HANDGUN
-- can NPCs use this weapon?
weapon.NPC = true
-- is the weapon unique? (true = it cannot be bought, needs to be found and extracted with to unlock it)
weapon.unique = false
-- can you conceal the weapon? (social stealth mechanic)
weapon.concealable = true
-- attachments
-- list of available attachments
weapon.selectableMods = weapons.genericPistolMods
-- list of attachments that require certain other attachments to allow being equipped (e.g. 3-round burst or full-auto trigger groups require an improved trigger)
weapon.modRequirements = weapons.genericPistolModRequirements
-- list of attachments that cannot be equipped together
weapon.modConflicts = weapons.genericPistolModConflicts
-- register and inherit missing properties
weapons:register(weapon, "p89")
-- overrides
weapon.bulletSpeed = p89.bulletSpeed
weapon.spreadPerShot = p89.spreadPerShot
