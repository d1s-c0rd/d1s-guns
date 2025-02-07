-- get weapon data to override
local weapon = weapons:getData("m1911")
-- search inside selectableMods for the correct attachment header
for _, mod in ipairs(weapon.selectableMods) do
    if mod.header == weapons.getModHeader("magazine") then
        -- update table with new attachment
        table.insert(mod.mods, "10mm_magazine")
        break
    end
end
-- IMPORTANT: assign icon or game will crash when applying the attachment
weapon.modIcons["10mm_magazine"] = weapon.modIcons.extended_magazine
-- override the attachment data when used with this particular weapon if needed
weapon.modOverrides["10mm_magazine"] = {
    magSize = 1,
    armorPenetration = 1,
    damage = 0.11,
    damageMin = 0.11,
    bulletSpeed = 0.495,
    noiseChange = 0,
    slowdown = 0,
    shotDeviation = -0.5,
    spreadPerShotMultiplier = -0.5,
    spreadPerShot = 1.1,
    maxSpreadIncrease = 0,
    noiseRadius = 0.174
}
-- IMPORTANT: call setupModCategoryMap() on the weapon to update the mod category map or the attachment won't be registered for the weapon and won't work
-- previous versions called weapons.register(weapon) to update the weapon but this causes stats to be incorrectly changed by the internal logic of the register method
weapon:setupModCategoryMap()