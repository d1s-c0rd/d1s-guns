local mag10mm = weapons.getModData("10mm_magazine")
-- overriding the weapon mod to add valueMods it doesn't possess to make them available for override
table.insert(mag10mm.valueMods, {"magSize", 0, "+"})
table.insert(mag10mm.valueMods, {"noiseRadius", 0})
table.insert(mag10mm.valueMods, {"shotDelay", 0})
mag10mm:onRegister()