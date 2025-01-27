--[[
Name: P226
A basic bitch copy of an already existing gun. Doesn't get much simpler than this to make a new gun.
]]

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
-- which slot it occupies
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
-- register and inherit missing properties
weapons:register(weapon, "p89")
