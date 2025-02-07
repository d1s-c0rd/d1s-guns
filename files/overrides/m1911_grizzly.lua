-- get weapon data to override
local weapon = weapons:getData("m1911")
-- search inside selectableMods for the correct attachment header
for _, mod in ipairs(weapon.selectableMods) do
    if mod.header == weapons.getModHeader("magazine") then
        -- update table with new attachment
        table.insert(mod.mods, "50ae_magazine")
        break
    end
end
-- IMPORTANT: assign icon or game will crash when applying the attachment
weapon.modIcons["50ae_magazine"] = weapon.modIcons.extended_magazine
-- override the attachment data when used with this particular weapon if needed
weapon.modOverrides["50ae_magazine"] = {
    magSize = 0,
    armorPenetration = 3,
    damage = 1.2,
    damageMin = 0.72,
    bulletSpeed = 0.859,
    noiseChange = 0,
    slowdown = 0,
    shotDeviation = 0.2,
    spreadPerShotMultiplier = 0.4,
    spreadPerShot = 1.5,
    maxSpreadIncrease = 0.3,
    noiseRadius = 0.26
}
-- IMPORTANT: call setupModCategoryMap() on the weapon to update the mod category map or the attachment won't be registered for the weapon and won't work
-- previous versions called weapons.register(weapon) to update the weapon but this causes stats to be incorrectly changed by the internal logic of the register method
weapon:setupModCategoryMap()