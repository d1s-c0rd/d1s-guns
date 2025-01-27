# Intravenous 2 - d1s_guns Mod

## Overview
This mod adds new weapons and attachments to Intravenous 2 using already existing game content as a base.

The project itself serves as a basis for people wanting to get into basic modding of Intravenous 2 guns and attachments.

You are free to edit and reuse the code contained in this project for your own purposes.

## Warning
This mod content is what I would consider "low effort", as in no custom graphics are provided by me for the new weapons and attachments, as such I've decided against publishing this on the Steam workshop for the time being.
Nonetheless included are the .41 AE caliber conversion for the Mini-UZI and the .50 BMG caliber conversion for the R700 (both mods I've published on the workshop).

Most weapon stats are inherited from other base game guns, as such many properties might not be explicitly declared in the weapon files. Sprites and animations are inherited in the same manner.

Balance of the guns and attachments isn't guaranteed, tweak them to your own liking.

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

## Notes
Various properties are set in the internal `register()` method for weapons, while some others are overridden.
In the case of overridden values, they need to be explicitly declared in the weapon config if you want them to be different from the parent weapon.

Values overridden in `register()`:
- noiseRadius (noiseRadius * 1.25)
- spreadPerShot (spreadPerShot * 1.5)
- maxSpreadVelocityIncrease (math.max(maxSpreadVelocityIncrease, spreadVelocityIncrease))

Values overridden in `adjustMuzzleVelocity()`:
- bulletSpeed (bulletSpeed * FPS_TO_MS)

## License
This project is licensed under the MIT License. See the LICENSE file for more details.
