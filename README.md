# Intravenous 2 - d1s_guns Mod

## Overview
This mod adds new weapons and attachments to Intravenous 2 using existing game content as a base.

The project serves as a foundation for those interested in basic modding of Intravenous 2 guns and attachments.

You are free to edit and reuse the code included in this project for your own purposes.

## Notes
This mod's content is what I would consider "low effort," as no custom graphics are provided by me for the new weapons and attachments, using instead base game content as stand-ins. As such, I've decided against publishing this on the Steam Workshop for the time being.
Nonetheless, included are the .41 AE caliber conversion for the Mini-UZI and the .50 BMG caliber conversion for the R700 (both mods I’ve published on the Workshop).

The balance of the guns and attachments is not guaranteed, so feel free to tweak them to your own liking if you use them in gameplay.

### On data inheritance

Most stats of the guns contained in this project are inherited from other base game guns; as such, many properties won't be declared in the included files. Sprites and animations are inherited in the same manner.

**IMPORTANT**: Weapons can inherit the attachments table (e.g., the G36C inherits the AR-15 `selectableMods` table) from other weapons or use shared tables (many pistols use the same `weapons.genericPistolMods` table, and my P226 does as well). As a side effect, any override of the `selectableMods` table will be replicated across every other weapon using the same table (whether inherited or shared) due to reference assignment to the table.

#### DLC data support

If you are using data from DLCs in your mod (either by inheriting properties or modifying them) you should account for the possibility that the user does not own the DLC. Attempting to start the game with a mod that tries referencing nonexistent data will cause the program to crash: as such it is necessary to prepare safety nets and manage fallbacks.

I have included a couple of examples on how to handle DLC checks: in `main.lua` there is an example of how to manage the loading of modules, while in the LC Charger file you will find an example of how to handle properties from DLCs.
An alternative could also be to separate modules that use DLC data into their own mod. The choice on how to handle DLC support is ultimately up to you.

### Properties

Please check the P226 file for detailed documentation of the basic properties of weapons.

#### Property override

Various properties are overridden within the internal `weapons:register()` method, which is usually called at the end of the weapon configuration to add the weapon to the game registry. If you don't declare these properties, they will simply inherit the same values as the properties of the weapon you are inheriting from, with a couple of important exceptions: `bulletSpeed` and `spreadPerShot`.
Due to the internal logic of the method, these two properties will always be overridden and should therefore be explicitly declared, with a raw value assigned before calling the method. Alternatively, they can be overridden after the method has been called by assigning the final values from other weapons (both examples are provided in the weapon files).

Following is a list of notable properties overridden within `weapons:register()` and how they are modified. If you wish to tweak these values, be sure to assign raw values before calling the method or to override them with the final values from other weapons after the method has been called.

- `noiseRadius` -> `noiseRadius * 1.25`
- `spreadPerShot` -> `spreadPerShot * 1.5`
- `bulletSpeed` -> `bulletSpeed * FPS_TO_MS` (`FPS_TO_MS` = `2.296588` | as such the raw value of bulletSpeed is in ft/s) (property modified inside `adjustMuzzleVelocity()`)

#### Attachments valueMods and weapons modOverrides

The `valueMods` table property of attachments contains the various properties that the attachment modifies. Meanwhile the `modOverrides` table property of weapons contains adjustments for the property modifiers of any attachment.

Due to how `modOverrides` works in the code, only overrides of modifiers already existing in the original valueMods will take effect. As an example, in the base game, `10mm_magazine` doesn't have `magSize`in its `valueMods`: as a side effect if you try to use `modOverrides` to override the magazine size of a weapon when using the 10MM Caliber Conversion it won't work (included in this mod is a patch that adds `magSize` to the `valueMods` table of `10mm_magazine`).

#### Weapon stats

Following is a reference sheet for how weapon properties are computed into stats.

**IMPORTANT**: the properties `noiseRadius`, `spreadPerShot` and `bulletSpeed` referenced below have already been modified as explained in the "[Property override](#property-override)" paragraph.

**Constants**:

- `PIXEL_TO_MS` = 30.5

**Damage per shot**
- Value = `damage` * `shots` (`shots` is generally 1 unless it's a shotgun)
- Total shot damage = `damage` * `shots` (`shots` is generally 1 unless it's a shotgun)
- Minimum damage = `damageMin`
- Effective range (M) = `rangeTotal` / `PIXEL_TO_MS` (`rangeTotal` = `rangeMin` + `rangeMax`)

**Accuracy**
- Value (°) = (if `clumpSpread` is defined) `clumpSpread` + `shotDeviation` (else) `spread` + `shotDeviation`
- Spread per shot (°) = `spreadPerShot`
- Max additive spread (°) = `maxSpreadIncrease`
- Max movement spread increase (%) = `spreadVelocityMax`
- Max turn spread increase (°) = `lookSpreadMax`
- Turn accuracy instability = `lookSpreadAngleMultiplier`

**Penetration**
- Value = `armorPenetration`

**Noise increase**
- Value (%) = `noiseChange` * 100

**Shot noise**
- Value (M) = `noiseRadius` / `PIXEL_TO_MS`

**Slowdown**
- Value (%) = `slowdown` * 100

**Weapon stats**:

- Total damage = `damage` * `shots` (`shots` is generally 1 unless it's a shotgun)
- Bullet speed (M/S) = `bulletSpeed` / `PIXEL_TO_MS`
- Rate of Fire = `rateOfFire`
- Magazine capacity = `magSize`
- Reload speed (%) = (1 + (1 - `reloadSpeedMultiplier`)) * 100
- Accuracy (°) = `spread`
- Shot deviation (°) = `shotDeviation`
- Accuracy recovery = `spreadDecrease` / 20
- Aim zoom range (%) = `cameraZoomMultAim` * 100
- Pellet group spread (°) = `clumpSpread`
- Spread-per-shot (°) = `spreadPerShot`
- Controllability (%) = (2.8 / `spreadPerShotMultiplier`) * 100
- Max additive spread (°) = `maxSpreadIncrease`
- Turn accuracy instability = `lookSpreadAngleMultiplier`
- Max turn spread (°) = `lookSpreadMax`
- Mobile accuracy (%) = (`spreadVelocityIncrease` / `maxSpreadVelocityIncrease`) * 100
- Focus accuracy boost (°) = `focusSpread`
- Focus accuracy speed = `focusSpreadSpeed`
- Shot noise (M) = `noiseRadius` / `PIXEL_TO_MS`
- Noise increase (%) = `noiseChange` * 100
- Slowdown (%) = `slowdown` * 100

## Installation

1. Download the project as zip
2. Create a new `d1s_guns` folder inside your Intravenous 2 mods directory
3. Extract the contents of the zip to the `d1s_guns` mod folder

## Features

### New Guns:

#### SPAS-12
Semi-automatic tube-fed shotgun in 12 Gauge (3-Round Burst trigger group available) (Mostly a M4 Super 90 clone)

#### SPAS-15
Semi-automatic magazine-fed shotgun in 12 Gauge (Full-auto trigger group available) (Mostly a Saiga-12K clone)

#### OTs-12 Tiss
Semi-automatic carbine in 9x39MM (Full-auto trigger group available)

#### OTs-14 Groza
Bullpup assault rifle in 9x39MM

#### Vektor R5
Assault rifle in 5.56x45MM

#### AUG A1
Bullpup assault rifle in 5.56x45MM with integrated optic

#### LC Charger
Semi-automatic pistol (primary) in 5.7x28MM (10MM conversion available) (Full-auto trigger group available)

#### MAG-7
Semi-auto magazine-fed shotgun in 12 Gauge

#### P226
Semi-automatic pistol in 9x19MM

#### P229
Semi-automatic pistol in .40S&W (9x19MM and .357 SIG conversions available)

### HK UCP
Semi-automatic pistol in 4.6x30MM

#### .44 Auto Mag Pistol
Semi-automatic pistol in .44 Magnum

### New attachments:

#### .357 SIG Caliber Conversion
Available for P229

#### .41 AE Caliber Conversion
Available for Mini-UZI

### .50 AE Caliber Conversion
Available for M1911

#### .50 BMG Caliber Conversion
Available for R700 (includes custom firing sound)

#### Shortened Barrel
Available for AUG

### Patches:

### 9MM Caliber conversion
Properties made available for override: `noiseRadius`

### 10MM Caliber conversion
Properties made available for override: `magSize`, `noiseRadius`, `shotDelay`
Added to: M1911

### .45 ACP Caliber conversion
Properties made available for override: `shotDelay`, `noiseChange`, `slowdown`

## License

This project is licensed under the MIT License. See the LICENSE file for more details.
