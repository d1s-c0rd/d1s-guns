local d1s_guns = {}
--[[
Adding event handler for ON_START_FINISH event.
Due to how the load order is setup, DLC data is always loaded after mods data, meaning we couldn't normally reference it inside our own files without the game crashing.
The ON_START_FINISH event is fired after the game has loaded all data so we're sure that at this point DLC data will have been loaded as well.
This doesn't mean that the DLC data will be available if somebody doesn't own the DLC, so it still remains necessary for us to handle fallbacks.
This event handler could be used to only load modules that make use of DLC data, but I'm currently just loading most of the data in here.
]]
function d1s_guns:handleEvent(event, data)
	self.load()
end

-- registering the event receiver
events:addDirectReceiver(d1s_guns, {game.EVENTS.ON_START_FINISH})

-- creating a table of weapons that will be added to the loadout screen
d1s_guns.addWeapons = {
	-- category/weapon ID/insert after weapon ID
	{weapons.TYPES.PRIMARY, "spas15", "saiga12k"},
	{weapons.TYPES.PRIMARY, "spas12", "m1014"},
	{weapons.TYPES.PRIMARY, "ots14", "asval"},
	{weapons.TYPES.PRIMARY, "ots12", "asval"},
	{weapons.TYPES.PRIMARY, "vektor5", "g36c"},
	{weapons.TYPES.PRIMARY, "auga1", "famas"},
	{weapons.TYPES.PRIMARY, "lccharger", "mp7"},
	{weapons.TYPES.SECONDARY, "p229", "p89"},
	{weapons.TYPES.SECONDARY, "p226", "p89"},
}

-- method for loading mod data
function d1s_guns.load()
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
	require("weapons/lccharger")

	d1s_guns.checkDLC()

	d1s_guns.addWeaponsToLoadout()
end

-- method for checking DLC data
function d1s_guns.checkDLC()
--[[
This is currently just a placeholder method, but it could be used to load modules only if certain DLCs are present or to load a different set of modules instead.
Example:
if *your DLC check* then
	require("module that uses DLC data")
else
	require("module that doesn't use DLC data")
end
]]
end

-- method for adding weapons to the loadout screen using addWeapons table
function d1s_guns.addWeaponsToLoadout()
	local baseCampaign = game.getCampaignData("base")

	for key, data in ipairs(d1s_guns.addWeapons) do
		baseCampaign:addLoadoutWeapon(data[1], data[2], data[3])
		baseCampaign:addLockedWeapon(data[2])
	end
end

-- rest of data to be loaded before the ON_START_FINISH event is fired
-- load sounds
require("sounds")
