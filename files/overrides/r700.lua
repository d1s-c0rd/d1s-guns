-- get weapon data to override
local weapon = weapons:getData("r700")
-- search inside selectableMods for the correct attachment header
for _, mod in ipairs(weapon.selectableMods) do
    if mod.header == weapons.getModHeader("magazine") then
        -- update table with new attachment
        table.insert(mod.mods, "50bmg_magazine")
        break
    end
end
-- IMPORTANT: assign icon or game will crash when applying the attachment
weapon.modIcons["50bmg_magazine"] = weapon.modIcons.extended_magazine
-- override the attachment data when used with this particular weapon if needed
weapon.modOverrides["50bmg_magazine"] = {}
-- IMPORTANT: call setupModCategoryMap() on the weapon to update the mod category map or the attachment won't be registered for the weapon and won't work
-- previous versions called weapons.register(weapon) to update the weapon but this causes stats to be incorrectly changed by the internal logic of the register method
weapon:setupModCategoryMap()
-- changing the firing sound based on the active attachments
function weapon:getFireSound()
    if self:isModActive("50bmg_magazine") then
        if self:isModActive("suppressor_nonpistol") then
            return "r870_fire_suppressed"
        end
        return "r700_50bmg"
    end
    return self._fireSound
end