
-- load sounds
require("sounds")
-- load ammo
require("ammo")
-- load attachments
require("weapon_attachments/shortened_barrel")
require("weapon_attachments/357sig_magazine")
require("weapon_attachments/41ae_magazine")
require("weapon_attachments/50bmg_magazine")
-- load overrides
require("overrides/mini_uzi")
require("overrides/r700")
require("overrides/10mm_magazine")
-- load weapons
require("weapons/spas15")
require("weapons/spas12")
require("weapons/ots12")
require("weapons/auga1")
require("weapons/vektor5")
require("weapons/ots14")
require("weapons/p226")
require("weapons/p229")

local addWeapons = {
	-- category/weapon ID/insert after weapon ID
	{weapons.TYPES.PRIMARY, "spas15", "saiga12k"},
	{weapons.TYPES.PRIMARY, "spas12", "m1014"},
	{weapons.TYPES.PRIMARY, "ots14", "asval"},
	{weapons.TYPES.PRIMARY, "ots12", "asval"},
	{weapons.TYPES.PRIMARY, "vektor5", "g36c"},
	{weapons.TYPES.PRIMARY, "auga1", "famas"},
	{weapons.TYPES.SECONDARY, "p229", "p89"},
	{weapons.TYPES.SECONDARY, "p226", "p89"},
}

local baseCampaign = game.getCampaignData("base")

for key, data in ipairs(addWeapons) do
	baseCampaign:addLoadoutWeapon(data[1], data[2], data[3])
	baseCampaign:addLockedWeapon(data[2])
end
