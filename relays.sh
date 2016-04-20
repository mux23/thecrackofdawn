#!/bin/bash

# this is a script to setup and use the GPIO pins on the Raspberry Pi 3

# I'm using the four pins at the end of the GPIO connector, which map to
# GPIO addresses 16, 20, 21 and 26, I'm using them for relays 1,2,3,4 on the
# relay board...

## RASPBERRY PI 3 MODEL B Pinout
## 
## GND| 26 | 19 | 13 | 06 | 05 | ID | GND| 11 | 09 | 10 |3.3v| 22 | 27 | 17 | 
## 21 | 20 | 16 | GND| 12 | GND| ID | 07 | 08 | 25 | GND| 24 | 23 | GND| 18
##

# CURRENTLY USING:
# Pin1 = 21
# Pin2 = 20
# Pin3 = 16
# Pin4 = 26

# export the pins for use
echo "16" > /sys/class/gpio/export
echo "20" > /sys/class/gpio/export
echo "21" > /sys/class/gpio/export
echo "26" > /sys/class/gpio/export

# set the GPIO direction
echo "out" > /sys/class/gpio/gpio16/direction 
echo "out" > /sys/class/gpio/gpio20/direction
echo "out" > /sys/class/gpio/gpio21/direction
echo "out" > /sys/class/gpio/gpio26/direction


function pin1 {
	echo $1 > /sys/class/gpio/gpio21/value
}

function pin2 {
        echo $1 > /sys/class/gpio/gpio20/value
}

function pin3 {
        echo $1 > /sys/class/gpio/gpio16/value
}

function pin4 {
        echo $1 > /sys/class/gpio/gpio26/value
}

for i in 1 2 3 4; do pin$i 0 && sleep .1 && pin$i 1 && sleep .1; done
