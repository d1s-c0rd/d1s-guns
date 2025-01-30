# Intravenous 2 - d1s_guns Mod

## Overview
This mod adds new weapons and attachments to Intravenous 2 using already existing game content as a base.

The project itself serves as a basis for people wanting to get into basic modding of Intravenous 2 guns and attachments.

You are free to edit and reuse the code contained in this project for your own purposes.

## Notes
This mod content is what I would consider "low effort", as in no custom graphics are provided by me for the new weapons and attachments, as such I've decided against publishing this on the Steam workshop for the time being.
Nonetheless included are the .41 AE caliber conversion for the Mini-UZI and the .50 BMG caliber conversion for the R700 (both mods I've published on the workshop).

Balance of the guns and attachments isn't guaranteed, tweak them to your own liking if using them for gameplay.

### On data inheritance

Most stats of the guns contained in this project are inherited from other base game guns and as such many properties might not be declared in the included files. Sprites and animations are inherited in the same manner.

**IMPORTANT**: weapons may inherit the attachments table (e.g. G36C inherits the AR-15 `selectableMods` table) of other weapons or use shared tables (a good deal of pistols use the same `weapons.genericPistolMods` table and my P226 does too). As a side effect any override of the `selectableMods` table will be replicated on every other weapon using the same table (inherited or shared) due to the reference assignment to the table.

### Properties

Please check inside the P226 file for a detailed documentation of basic properties for weapons.

#### Property override

Various properties are overridden inside the internal `weapons:register()` method usually called at the end of the weapon config to actually add the weapon to the game registry.
If you don't declare these property they will simply be assigned the same value as the properties of the weapon you're inheriting from with a couple of important exceptions: `bulletSpeed` and `spreadPerShot`.
Due to the internal logic of the method these two properties will always be overridden and as such should always be explicitly declared (as in providing a raw value) before calling the method or they should be overridden after the method has been called by assigning them the value of other weapons properties (both examples are provided in the weapon files).

Following is a list of notable properties overridden inside `weapons:register()` and how they're modified.
If you wish to tweak these values be sure to always provide raw values before calling the method or override them by assignment after the method has been called.

- `noiseRadius` -> `noiseRadius * 1.25`
- `spreadPerShot` -> `spreadPerShot * 1.5`
- `bulletSpeed` -> `bulletSpeed * FPS_TO_MS` (`FPS_TO_MS` = `2.296588` | as such the raw value of bulletSpeed is in ft/s) (property modified inside `adjustMuzzleVelocity()`)

## Installation
1. Download the project as zip
2. Create a new `d1s_guns` folder inside your Intravenous 2 mods directory
3. Extract the contents of the zip to the `d1s_guns` mod folder

## Features

### New Guns:

#### SPAS-12
Semi-auto tube-fed shotgun in 12 Gauge (3-Round Burst trigger group available) (Mostly a M4 Super 90 clone)

#### SPAS-15
Semi-auto magazine-fed shotgun in 12 Gauge (Full-auto trigger group available) (Mostly a Saiga-12K clone)

#### OTs-12 Tiss
Semi-auto carbine in 9x39MM (Full-auto trigger group available)

#### OTs-14 Groza
Bullpup assault rifle in 9x39MM

#### Vektor R4
Assault rifle in 5.56x45MM

#### AUG A1
Bullpup assault rifle in 5.56x45MM with integrated optic

#### P226
Semi-automatic pistol in 9x19MM

#### P229
Semi-automatic pistol in .40S&W (9x19MM and .357 SIG conversions available)

### New attachments:

#### .357 SIG Caliber Conversion
Available for P229

#### .41 AE Caliber Conversion
Available for Mini-UZI

#### .50 BMG Caliber Conversion
Available for R700 (includes custom firing sound)

#### Shortened Barrel
Available for AUG

## License
This project is licensed under the MIT License. See the LICENSE file for more details.
