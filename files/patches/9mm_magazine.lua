local mag9mm = weapons.getModData("9mm_magazine")
-- overriding the weapon mod to add valueMods it doesn't possess to make them available for override
table.insert(mag9mm.valueMods, {"noiseRadius", 0})
mag9mm:onRegister()