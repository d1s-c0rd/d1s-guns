local mag10mm = weapons.getModData("10mm_magazine")
-- overriding the 10MM Caliber conversion mod to add magSize to valueMods, allowing for the increase or reduction of magazine size depending on the weapon
table.insert(mag10mm.valueMods, {"magSize", 0, "+"})
mag10mm:onRegister()