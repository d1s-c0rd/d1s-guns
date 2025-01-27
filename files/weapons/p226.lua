--[[
Name: P226
A basic bitch copy of an already existing gun. Doesn't get much simpler than this to make a new gun.
]]

local weapon = {}
-- basic data
weapon.id = "p226"
weapon.name = _T("WEAPON_NAME_P226", "P226")
weapon.trivia = _T("WEAPON_NAME_P226_TRIVIA",
    "A Swiss-German Wonder Nine, popular among law enforcement and military units worldwide.")
weapon.price = 800
weapon.type = weapons.TYPES.SECONDARY
weapon.category = weapons.CATEGORIES.HANDGUN
weapon.NPC = true
weapon.unique = false
weapon.concealable = true
-- register and inherit missing properties
weapons:register(weapon, "p89")
