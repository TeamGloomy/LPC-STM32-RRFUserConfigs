# Caribou MK3s 220

## Hardware

* Bondtech Extruder
* Mosquito Magnum w/ 50W heater catridge and Slice Thermistor
* SKR 1.4 Turbo
* TMC 2209 UARTs
* BLTouch probe
* Pete's Playground Raspberry Pi to SKR 1.3/1.4/PRO/GTR connector

## Notes

Connectors for Part Cooling and Hotend Cooling are swapped. This means that the Part Cooling fan is connected to HE1, while the Hotend Cooling fan is connected to FAN0. Reason? The mosfet for FAN0 seems to be broken and always runs full power, so at least I can continue printing this way.

## Links

I keep an up-to-date copy of my working configuration at https://github.com/docbobo/SKR-Caribou-RepRap