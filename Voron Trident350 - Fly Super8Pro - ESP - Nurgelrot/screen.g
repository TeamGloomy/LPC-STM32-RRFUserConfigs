; ST7567 Init for Mini12864 Panel

; Configure Neopixel
M950 E0 C"LCD_D5" 
; Turn off backlight
M150 K0 R0 U0 B0 S3 F0
; Configure reset pin
M950 P1 C"LCD_D4" 
; hardware reset of LCD
M42 P1 S0
G4 P500
M42 P1 S1
; Turn display on
M918 P2 C30 F1000000 E4
; Fade in backlight
while iterations < 256
    M150 K0 R255 U255 B255 P{iterations} S1 F0
    G4 P20
; flash Button 3 times
while iterations < 3
    M150 K0 R255 U255 B255 P255 S1 F1
    M150 K0 R0 U255 B0 P255 S2 F0
    G4 P250
    M150 K0 R255 U255 B255 P255 S1 F1
    M150 K0 R0 U255 B0 P0 S2 F0
    G4 P250
; Display "ready" button state  
M150 K0 R255 U255 B255 P255 S1 F1
M150 K0 R255 U0 B0 P255 S2 F0