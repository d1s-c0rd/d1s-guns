local mod = {
    id = "357sig_magazine",
    price = 2500,
    name = _T("WEAPON_MOD_357SIG_CALIBER_CONVERSION_SHORT", ".357 SIG Cal."),
    nameFull = _T("WEAPON_MOD_357SIG_CALIBER_CONVERSION_FULL", ".357 SIG Caliber conversion"),
    description = {{_T("WEAPON_MOD_357SIG_CALIBER_CONVERSION_DESC", "Converts the weapon to use the .357 SIG caliber."),
                    true}},
    ammoList = ammo.list357SIG,
    valueMods = {{"shotDeviation", -0.15}, {"spreadPerShotMultiplier", 0.1}, {"noiseChange", 0.05, "+"},
                 {"bulletSpeed", 0.15}, {"damage", 0.15}, {"damageMin", 0.15}, {"spreadPerShot", -0.1},
                 {"slowdown", 0.003, "+"}},
    universalUnlock = false,
    countForGunSchizo = false
}
weapons.registerWeaponMod(mod, "10mm_magazine")
