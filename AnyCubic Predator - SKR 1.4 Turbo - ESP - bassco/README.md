# AnyCubic Predator

## Hardware

* SKR1.4T
* TMC2208 UART (Diag pins cut)
* AnyCubic V2 probe
* TriangleLab BMG Bondtech clone and pancake stepper (S1 motor direction)
* MPJET ball joints on original arms
* Pete's Playground ESP8266 breakout board on EXP1 and EXP2
* BTT TFT35 V3.0 on TFT pins - with Unified Material Theme

## Notes

We use the HE1 output for the hotend fan as there are not enough PWM fan connections on the board. This allows the hotend fan to start blowing when the hotend reaches 45C and is rising. Once the hotend cools to below 45C, the fan shuts down.

- Filament sensor is pin _e0stop_
- Manual V2 probe is on _e1stop_
- FAN0 - pwm - , fan0 in config.g, part cooling fans (FAN2 labels)
- HE1 - fan1 in config.g, hotend fan - thermostatically linked to TH0 (FAN 1 label)
- FAN2 - always on - internal board cooling fan for the stepper drivers - no config required

## PID Tuning

- M303 H1 S240
- M307 H1
- M303 H0 S80
- M307 H0
- M500; save to config-override.g

## z height and levelling

- M558 P5 H30 F1200 T6000; Start high to avoid bed crash
; Disable 5mm endstop backoff from homedelta.g
- M561 ; cancel bed compensation
- M208 S1 Z-3 ; disable z to -3mm below the bed
; move bed with probe to paper test; set Z=0 with
- G92 Z0
- G1 Z5; back up 5mm for probe test
- G30 S-1 ;to probe without saving z=0
- M561
- G32 ; 6 point calibration
- M665 ; show sizes and endstops
- M666 ; show angles
- M500 ; save to config-override.g
- M501; load values from config-override.g
; Enable 5mm endstop backoff from homedelta.g

## Troubleshooting

### TFT Screen

#### TFT35 screen blank

Hold the button in and change from Marlin to TFT Mode

#### No printer attached

Go into the TFT Settings and change the baud rate to 57600 to match the setting in config.g

### Probe

If the probe is constantly triggered when not depressed, switch the pin value by adding a `!` symbol.

