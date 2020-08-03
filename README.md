# LPCRRFUserConfigs

A repository of user created configs for 3D printers running the LPC port of RRF

# How to add to the repository

Clone this wiki, add your config in its own folder and then create a pull request.

# Naming convention

The naming convention for the folder is as follows:

Printer Name - Board Name - Connection Type - User

e.g.

Da Vinci Jr - SKR 1.4 Turbo - SBC - jaysuk

## Connection Type

Is one of

- SBC - Single Board Computer; e.g. Raspberry Pi
- ESP - Wifi breakout board - e.g. Pete's Playground ESP8266 module

# Files to include

Please only include the following files:
- bed.g
- board.txt
- config.g
- homeall.g/homedelta.g
- homex.g
- homey.g
- homez.g
- pause.g
- resurrect.g
- sleep.g
- start.g
- stop.g
- tfreeX.g - There could be more than one depending on tools
- tpostX.g - There could be more than one depending on tools
- tpreX.g - There could be more than one depending on tools

You are also welcome to include any macro files in a folder called Macros
