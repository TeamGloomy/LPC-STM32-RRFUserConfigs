
# Tenlog D3 IDEX or QuadIDEX Custom MOD - FLY 407 ZG - ESP - SpacePini

## Hardware

* FLY 407 ZG Board

* FLY 7" TFT

* FLY TMC2209

* BLTouch 

* 2xHemera DirectDrive
*  230V 600W Silicone Heater
* 2 Amp Y-Stepper Motor, adjust it! 

## Notes

* This is an IDEX or QuadIDEX configuration, only 2 hotends activated. 

* No Filament Sensor

* Drivemapping: X0 Y1 Z2:4 U3 E5:6 P4  ----- X=0, Y=1, Z=2 and 3, X2=U=4 and Z2=V=3, extruder motors 8 and 9. Drive 2 and 4 is combined Z. 4 axes are visible

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

* M500                   ; save to config-override.g

> Written with [StackEdit](https://stackedit.io/).
