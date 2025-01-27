--[[
Name: AUG A1
Why I made this? First: I really really like the AUG. Second: I wanted to try making a gun with a fixed attachment (in this case a 1.5x scope that is actually just the 2x scope but with less sway when not focusing).
]] local famas = weapons:getData("famas")

local weapon = {}
-- basic data
weapon.id = "auga1"
weapon.name = _T("WEAPON_NAME_AUG_A1", "AUG A1")
weapon.trivia = _T("WEAPON_NAME_AUG_A1_TRIVIA",
    "Bull-pup assault rifle from Austria with a quick-change barrel system, allowing the user to adapt their weapon to the mission parameters on the fly.\n\nFeatures a fixed 1.5x scope.")
weapon.price = 5000
weapon.type = weapons.TYPES.PRIMARY
weapon.category = weapons.CATEGORIES.RIFLE
weapon.NPC = true
weapon.unique = false
weapon.concealable = false
-- ammo
weapon.magSize = 30
weapon.ammoOnGive = weapon.magSize * 2
weapon.maxAmmo = weapon.magSize * 3
-- stats
weapon.rateOfFire = 720
weapon.spreadPerShot = 0.7
weapon.firemodes = {"fullauto", "semiauto"}
weapon.aimConeWidth = 15
weapon.cameraZoomMultAim = 1.35
-- attachments
weapon.selectableMods = {{
    header = weapons.getModHeader("barrel_type"),
    mods = {"shortened_barrel", "match_barrel", "extended_barrel"}
}, {
    header = weapons.getModHeader("barrel"),
    mods = {"compensator", "suppressor_nonpistol"}
}, {
    header = weapons.getModHeader("magazine"),
    mods = {"extended_magazine", "smaller_magazine"}
}, {
    header = weapons.getModHeader("spring"),
    mods = {"heavy_spring", "light_spring"}
}, {
    header = weapons.getModHeader("trigger"),
    mods = {"improved_trigger"}
}, {
    header = weapons.getModHeader("magwell"),
    mods = {"flared_magwell"}
}, {
    header = weapons.getModHeader("handguard_rail"),
    mods = {"laser_pointer", "laser_pointer_ir"}
}, {
    header = weapons.getModHeader("handguard"),
    mods = {"foregrip"}
}, {
    header = weapons.getModHeader("grip"),
    mods = {"comfort_grip"}
}}
weapon.modOverrides = {
    extended_magazine = {
        magSize = 12
    }
}
weapon.modIcons = famas.modIcons
weapon.modIcons.match_barrel = weapon.modIcons.extended_barrel
weapon.modIcons.shortened_barrel = weapon.modIcons.compensator

-- register and inherit missing properties
weapons:register(weapon, "famas")
-- methods for handling scope sway copied from scope_2x.lua, values tweaked for less sway
function weapon:update()
    local owner = self.getOwner(self)
    local minSpreadNVGAim = 0.7
    local onAimSpreadWait = 0.15
    if owner.PLAYER then
        if not owner.getAiming(owner) then
            self.addSpread = math.max(self.addSpread, self:getFinalSpreadValue())
            self.curFocusSpread = 0
            if self.wasAim then
                self.spreadWait = onAimSpreadWait
                self.wasAim = false
            end
        else
            if owner.getNVGActive(owner) then
                self.addSpread = math.max(self.addSpread, self:getFinalSpreadValue() * minSpreadNVGAim)
            end
            if not self.wasAim then
                self.spreadWait = onAimSpreadWait
                self.wasAim = true
            end
        end
    end
end

function weapon:getFinalSpreadValue()
    local minSpreadNonAimLaser = 0.1
    local minSpreadNonAim = 0.2
    if self.LASER_ACTIVE then
        return math.max(self.addSpread, self.maxSpreadIncrease * minSpreadNonAimLaser)
    end
    return math.max(self.addSpread, self.maxSpreadIncrease * minSpreadNonAim)
end
