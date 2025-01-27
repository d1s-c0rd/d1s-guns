local mod = {
    id = "41ae_magazine",
    price = 2500,
    name = _T("WEAPON_MOD_41AE_CALIBER_CONVERSION_SHORT", ".41 AE Cal."),
    nameFull = _T("WEAPON_MOD_41AE_CALIBER_CONVERSION_FULL", ".41 AE Caliber conversion"),
    description = {{_T("WEAPON_MOD_41AE_CALIBER_CONVERSION_DESC", "Converts the weapon to use the .41 AE caliber."),
                    true}},
    ammoList = ammo.list41AE,
    valueMods = {{"shotDeviation", -0.05}, {"spreadPerShotMultiplier", 0.1}, {"bulletSpeed", -0.2}, {"damage", 0.2},
                 {"damageMin", 0.2}, {"spreadPerShot", 0.15}, {"maxSpreadIncrease", 0.2}, {"magSize", 0, "+"}},
    universalUnlock = false,
    countForGunSchizo = false
}
weapons.registerWeaponMod(mod, "10mm_magazine")
