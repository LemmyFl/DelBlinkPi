#!/bin/bash

# Update the 
sudo apt update

# Make blink1 flash orange for 10 seconds
blink1-tool --delay 1000 --rgb 255,136,0  --blink 10

#blink1 glow red
blink1-tool --red

# Make skript wait 5 seconds
sleep 5

# Use DD to securely erase the disk 7 times with random numbers
for _ in {1..7}; do
    sudo dd if=/dev/zero of=/dev/sda bs=1M status=progress ||     blink1-tool --delay 1000 --red  --blink 0
done
# Make blink1 green when erase is completed successfully

# Make skript wait 5 seconds
sleep 5

#blink1 glow green
blink1-tool --green
