local caliber = {
    -- unique id of the ammo
    id = "",
    -- price of the ammo type
    price = 0,
    -- icon for the attachment mod when equipped
    icon = "",
    -- icon for the attachment mod when not equipped
    iconInactive = "",
    -- display name of the ammo
    display = "",
    -- display name of the ammo type
    switchDisplay = "",
    -- list of descriptions to add to the stats list shown when hovering the ammo type in the loadout screen (optional)
    -- second parameter is a boolean that defines whether the description should be shown on top of the positives (green) or negatives (red)
    description = {},
    -- trivia about the ammo displayed when hovered in the loadout screen if a gun is chambered in it
    trivia = "",
    -- world sprites for ammo piles and boxes
    world = {
        pile = "",
        box = ""
    },
    -- if rounds placed in the world are below this amount then use ammo pile sprite else use ammo box
    minimum = 0,
    -- used for ordering the ammo icon in the loadout screen
    power = 0,
    -- used for grouping ammo types
    limitID = 0,
    -- modifiers applied to the weapon when the ammo type is used
    valueMods = {}
}
-- overrides are being done to inherit the pre-existing sprites and icons and for the value adjustments of the various ammo types
-- .41 AE
local caliber = {
    id = "41AE",
    display = _T("AMMO_41AE", ".41 AE"),
    trivia = _T("AMMO_41AE_TRIVIA",
        "A nowadays obscure cartridge comparable to .40 S&W.\n\nThe smaller brother of .50 Action Express."),
    power = 24,
    limitID = ammo.makeLimitID()
}
ammo.register(caliber, "40SW")
-- .41 AE Match
local caliber = {
    id = "41AEM",
    price = 1500,
    display = _T("AMMO_41AE", ".41 AE"),
    switchDisplay = _T("AMMO_MATCH_GRADE", "Match"),
    limitID = ammo.getLimitID("41AE")
}
ammo.register(caliber, "40SWM")
-- .41 AE Subsonic
local caliber = {
    id = "41AESS",
    price = 700,
    display = _T("AMMO_41AE", ".41 AE"),
    switchDisplay = _T("AMMO_SUBSONIC", "Subsonic"),
    limitID = ammo.getLimitID("41AE")
}
ammo.register(caliber, "40SWSS")
-- .41 AE Overpressure
local caliber = {
    id = "41AEOP",
    price = 500,
    display = _T("AMMO_41AE", ".41 AE"),
    switchDisplay = _T("AMMO_OVERPRESSURE", "Overpressure"),
    limitID = ammo.getLimitID("41AE")
}
ammo.register(caliber, "40SWOP")
-- Ammo list
ammo.list41AE = ammo.setupAmmoListReferences({"41AE", "41AEOP", "41AEM", "41AESS"})
-- .50 BMG
local caliber = {
    id = "50BMG",
    display = _T("AMMO_50BMG", ".50 BMG"),
    trivia = _T("AMMO_50BMG_TRIVIA",
        "Ammo originally developed for the M2 Browning heavy machine gun, it has since become one of the premier choices for anti-materiel rifles."),
    minimum = 10,
    power = 200,
    limitID = ammo.makeLimitID()
}
ammo.register(caliber, "7.62x51MM")
-- .50 BMG Match
local caliber = {
    id = "50BMGM",
    price = 1500,
    display = _T("AMMO_50BMG", ".50 BMG"),
    switchDisplay = _T("AMMO_MATCH_GRADE", "Match"),
    minimum = 10,
    limitID = ammo.getLimitID("50BMG")
}
ammo.register(caliber, "7.62x51MMM")
-- .50 BMG +P
-- I wanted to add a +P variant of .50 BMG, but since 7.62x51MM doesn't have a +P variant I'm using 45ACP Overpressure to inherit valueMods while using 7.62x51MM Subsonic sprites and icons
local caliber = {
    id = "50BMGOP",
    price = 2000,
    icon = "caliber_762x51mm_ss",
    iconInactive = "caliber_762x51mm_ss_idle",
    display = _T("AMMO_50BMG", ".50 BMG"),
    switchDisplay = _T("AMMO_OVERPRESSURE", "Overpressure"),
    -- here I'm copying the generic overpressure ammo description and adding a new one to the negatives
    description = {{_T("AMMO_GENERIC_OVERPRESSURE", "Overpressure ammo, which trades recoil for stopping power."), true},
                   {_T("AMMO_50BMG_OVERPRESSURE_WARRANTY", "Shooting these will void any warranty."), false}},
    world = {
        pile = "762x51mm_ss_pile",
        box = "762x51mm_ss_box"
    },
    minimum = 10,
    limitID = ammo.getLimitID("50BMG")
}
ammo.register(caliber, "45ACPOP")
-- Ammo list
ammo.list50BMG = ammo.setupAmmoListReferences({"50BMG", "50BMGOP", "50BMGM"})
-- .357 SIG
local caliber = {
    id = "357SIG",
    display = _T("AMMO_357SIG", ".357 SIG"),
    trivia = _T("AMMO_357SIG_TRIVIA", "A bottle-necked pistol cartridge derived from 10MM Auto."),
    power = 26,
    limitID = ammo.makeLimitID()
}
ammo.register(caliber, "10MMAUTO")
-- .357 SIG Match
local caliber = {
    id = "357SIGM",
    price = 1500,
    display = _T("AMMO_357SIG", ".357 SIG"),
    switchDisplay = _T("AMMO_MATCH_GRADE", "Match"),
    limitID = ammo.getLimitID("357SIG")
}
ammo.register(caliber, "10MMAUTOM")
-- .357 SIG Subsonic
local caliber = {
    id = "357SIGSS",
    price = 700,
    display = _T("AMMO_357SIG", ".357 SIG"),
    switchDisplay = _T("AMMO_SUBSONIC", "Subsonic"),
    limitID = ammo.getLimitID("357SIG")
}
ammo.register(caliber, "10MMAUTOSS")
-- .357 SIG Overpressure
-- I wanted to add a +P variant of .357 SIG, but since 10MM Auto doesn't have a +P variant I'm using 45ACP Overpressure to inherit valueMods while using 10MM Auto Match sprites and icons
local caliber = {
    id = "357SIGOP",
    price = 1000,
    icon = "caliber_10mm_match",
    iconInactive = "caliber_10mm_match_idle",
    display = _T("AMMO_357SIG", ".357 SIG"),
    switchDisplay = _T("AMMO_OVERPRESSURE", "Overpressure"),
    world = {
        pile = "10mm_match_pile",
        box = "10mm_match_box"
    },
    limitID = ammo.getLimitID("357SIG")
}
ammo.register(caliber, "45ACPOP")
-- Ammo list
ammo.list357SIG = ammo.setupAmmoListReferences({"357SIG", "357SIGOP", "357SIGM", "357SIGSS"})
