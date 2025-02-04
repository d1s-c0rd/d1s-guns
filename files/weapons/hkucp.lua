--[[
Name: HK UCP
Literally just a Five-seveN but chambered in 4.6x30MM. Made it to demonstrate module load skipping when missing data.
]]

-- getting reference to other weapons in case in we need to inherit some properties
local fiveseven = weapons:getData("fiveseven")

-- instancing an empty table for the new weapon
local weapon = {}
-- basic data
-- unique ID of the weapon
weapon.id = "hkucp"
-- display name
weapon.name = _T("WEAPON_NAME_HK_UCP", "HK UCP")
-- description displayed when hovering the gun in the loadout selection screen
weapon.trivia = _T("WEAPON_NAME_HK_UCP_TRIVIA",
    "The \"Universal Combat Pistol\" chambered in 4.6x30MM. Developed as an answer to the FN Five-seveN.")
-- price of the weapon
weapon.price = 2200
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
-- ammo
weapon.ammoType = "4.6x30MM"
weapon.ammoTypeList = ammo.list46x30MM
weapon.bulletSpeed = 3500
-- stats
weapon.spreadPerShot = 0.50
-- register and inherit missing properties
weapons:register(weapon, "fiveseven")