# Sovol SV01 

## Hardware
* FLY CDYv2 Onboard Wifi
* FLY TMC2209
* FLY 4.3" TFT
* ANTCLABS BLTouch 3.1
* E3D Hemera DirectDrive

## Notes

* I am using 2 big fans with E2.
* Drivemapping: X Y Z Z2=E0 E1
* No Filamentsensor
* Also 4mm leadscrews so adjust your steps
* Setup your Power-Loss settings, i use 27V input

## Macros

* There are about 2.000 Macros sorted in a folder

## PID
- Hotend:

* M303 H1 Sxxx
or
* M307 H1
 #
- Bed:
* M303 H0 Sxx
or
* M307 H0
#
- Safe:
* M500; save to config-override.g

​



> Written with [StackEdit](https://stackedit.io/).
