local mod = {
    id = "shortened_barrel",
    price = 250,
    name = _T("WEAPON_MOD_SHORTENED_BARREL", "Short. barrel"),
    nameFull = _T("WEAPON_MOD_SHORTENED_BARREL_FULL", "Shortened barrel"),
    valueMods = {{"bulletSpeed", -0.15}, {"clumpSpread", 0.1}, {"shotDeviation", 0.1}, {"damage", -0.1},
                 {"damageMin", -0.1}, {"lookSpreadAngleMultiplier", -0.1}, {"noiseChange", -0.02, "+"},
                 {"slowdown", -0.003, "+"}, {"focusSpread", -0.1}, {"focusSpreadSpeed", 0.1}, {"spreadPerShot", 0.02},
                 {"maxSpreadIncrease", 0.05}, {"spreadVelocityIncrease", 0.1}},
    universalUnlock = false,
    countForGunSchizo = false
}
weapons.registerWeaponMod(mod, "base_weapon_mod")
