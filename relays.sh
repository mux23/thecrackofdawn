#!/bin/bash

# this is a script to setup and use the GPIO pins on the Raspberry Pi 3

# I'm using the four pins at the end of the GPIO connector, which map to
# GPIO addresses 16, 20, 21 and 26, I'm using them for relays 1,2,3,4 on the
# relay board...

# export the pins for use
echo "16" > /sys/class/gpio/export
echo "20" > /sys/class/gpio/export
echo "21" > /sys/class/gpio/export
echo "26" > /sys/class/gpio/export

# set the GPIO direction
echo "out" > /sys/class/gpio/gpio21/direction 
echo "out" > /sys/class/gpio/gpio20/direction
echo "out" > /sys/class/gpio/gpio26/direction
echo "out" > /sys/class/gpio/gpio26/direction


function pin {
	echo $1 > /sys/class/gpio/gpio21/value
}


echo "0" > /sys/class/gpio/gpio21/value
echo "1" > /sys/class/gpio/gpio21/value
echo "0" > /sys/class/gpio/gpio21/value
echo "1" > /sys/class/gpio/gpio21/value
