// To compile this file use this command:
$ make -f Makefile clean all

How to use this application:

Connect with GND using 1k resistor this pin:
LPC J6.39

Connect with a wire these pins:
J34.4 with J31.7
J34.5 with J31.8

Prepaire a connection (iMX6 Rex J31 with LPCXpresso J6):
J31.3 with J6.9
J31.5 with J6.10
J31.7 with J6.38
J31.8 with J6.4
J31.9 with J6.1
J31.10 with J6.28

The purpose of this code is to program e.g. a binary file to a LPC13xx family processor.

How to run this program:
Note: The commands for the I2C GPIO Expander are depending on chosen GPIOs. i2c-tools need to be installed. Please refer to the wiki page for more info.

$ i2cset 1 0x27 0x02 0xF3 // set GPIO 0.2 and GPIO 0.3 to low
$ i2cset 1 0x27 0x06 0xF3 // set GPIO 0.2 and GPIO 0.3 as output
$ i2cset 1 0x27 0x02 0xFB // set GPIO 0.3 to high 

$ ./lpc21isp -bin blinky.bin /dev/ttymxc1 115200 12000

$ i2cset 1 0x27 0x02 0xF7 // set GPIO 0.2 to high and GPIO 0.3 to low
$ i2cset 1 0x27 0x02 0xFF// set GPIO 0.2 and GPIO 0.3 to high
