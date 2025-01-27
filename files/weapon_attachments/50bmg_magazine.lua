local mod = {
    id = "50bmg_magazine",
    price = 5000,
    name = _T("WEAPON_MOD_50BMG_CALIBER_CONVERSION_SHORT", ".50 BMG Cal."),
    nameFull = _T("WEAPON_MOD_50BMG_CALIBER_CONVERSION_FULL", ".50 BMG Caliber conversion"),
    description = {{_T("WEAPON_MOD_50BMG_CALIBER_CONVERSION_DESC", "Converts the weapon to use the .50 BMG caliber."),
                    true}},
    ammoList = ammo.list50BMG,
    valueMods = {{"shotDeviation", -0.05}, {"spreadPerShotMultiplier", 0.6}, {"bulletSpeed", 0.1}, {"damage", 0.75},
                 {"damageMin", 0.75}, {"spreadPerShot", 0.6}, {"maxSpreadIncrease", 0.6}, {"magSize", 0, "+"},
                 {"noiseRadius", 0.64}, {"reloadSpeedMultiplier", 0.5}},
    universalUnlock = false,
    countForGunSchizo = false
};
weapons.registerWeaponMod(mod, "10mm_magazine");
