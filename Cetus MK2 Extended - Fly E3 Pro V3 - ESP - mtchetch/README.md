# Configs for Cetus MK2 extended
Print volume 180x180x280

Using E3 Fly Pro V3 board with the included PT100 thermal probe (variant)

Inspired by https://www.cnckitchen.com/blog/cetus-mk3-to-mellow-fly-rrf-e3-conversion
## Modifications
Added a stabilizing brace https://www.thingiverse.com/thing:2924407

60mm Fan adapter to fit a 5V 60mm Noctua silent fan https://www.thingiverse.com/thing:2089971

Diy detachable z-probe based on a microswitch. The probe is a cylinder that houses the switch and that has a magnet glued on the end to be able to attach to the print head next to the hot end.

## Notes on installation

The ribbon cable attaches to a daughter board on top of the extruder. This is grounded through the screws and the fan is switched on the negative side. The pcb must be insulated from the motor and the screws with plastic grommets to enable fan switching to work.

Diy end stops were added to each axis using micro switches recycled from old mice.

No heated bed installed. Since my original cetus bed was worn out, I added a sheet of 3mm polycarbonate on top with good results. When printing thin features, helper ears need to be added to prevent parts from curling off the build plate but on general prints it works well.

### Cabling

The pin out diagram is done while viewing the ribbon cable end facing you. Be sure to check the pin outs before going live.

![Alt text](ribbon_pinout.jpg?raw=true "Ribbon, sensor and heater pin out")

The connections were made using a 16pin piece of an old IDE cable pin header and soldering wires directly to that. That way the header can be easily unplugged from the ribbon cable for servicing. 

Heater wires need to be doubled up and the PT100 sensor needs to be converted to 3-pin as per the E3 Fly Pro V3 instruction page https://teamgloomy.github.io/fly_e3_pro_general.html.

The board was powered with the original Cetus power supply that is really a 120w HP laptop power supply. An adapter cable was made with the HP dc jack so that it could be used directly.

The cooling fan needs to be installed so that the minus terminal of the fan is in the fan connector and the plus terminal is connected to a pin on the board that suplies +5V. I used the screen connector for that since I do not use a screen. The daughter board on top of the extruder needs to be insulated for to fan negative side switching to work.