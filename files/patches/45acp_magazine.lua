local mag45acp = weapons.getModData("45acp_magazine")
-- overriding the weapon mod to add valueMods it doesn't possess to make them available for override
table.insert(mag45acp.valueMods, {"shotDelay", 0})
table.insert(mag45acp.valueMods, {"noiseChange", 0, "+"})
table.insert(mag45acp.valueMods, {"slowdown", 0, "+"})
mag45acp:onRegister()