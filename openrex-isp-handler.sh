#!/bin/sh
# OpenRex ISP programmer handler
# This is a script to perform programming procedure for on-board LPC13xx microcontroller
#
# Parameters:
# $1 - relative path to binary which will be used
#
# Hardware connection:
# for communication is used UART2
# MCU_ISPn -> GPIO1_IO18 -> mapped as gpio18
ISP=18
# MCU_RSTINn -> GPIO1_IO16 -> mapped as gpio16
RST=16
#
# Initialize GPIO pins
echo $RST > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio$RST/direction
echo 1 > /sys/class/gpio/gpio$RST/value

echo $ISP > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio$ISP/direction
echo 1 > /sys/class/gpio/gpio$ISP/value

echo 0 > /sys/class/gpio/gpio$ISP/value # set ISP to low
echo "ISP low"
sleep 0.01
echo 0 > /sys/class/gpio/gpio$RST/value # set RST to low
echo "RST low"
sleep 0.01
echo 1 > /sys/class/gpio/gpio$RST/value # release reset - start ISP routine
echo "RST released"
sleep 0.01

./lpc21isp -bin $1 /dev/ttymxc1 115200 12000

echo 0 > /sys/class/gpio/gpio$RST/value # set RST to low
echo "RST low"
sleep 0.01
echo 1 > /sys/class/gpio/gpio$ISP/value # set ISP to low
echo "ISP high"
echo in > /sys/class/gpio/gpio$ISP/direction
sleep 0.01
echo 1 > /sys/class/gpio/gpio$RST/value # release reset - start ISP routine
echo "RST released"
