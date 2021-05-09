
# Tenlog D3 Cusom MOD - FLY 407 ZG - ESP - TMC2209

## Hardware

* FLY 407 ZG Board

* FLY 7" TFT

* FLY TMC2209

* BLTouch 

* 2xHemera DirectDrive
*  230V Silicone Heater
* 2 Amp Y-Stepper Motor, adjust it! 

## Notes

* This is a QIDEX Configuration for 4 independent hotends but it is set to 2 hotends for normal IDEX
* Configure your extruder offsets! 

* No filament sensor

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
