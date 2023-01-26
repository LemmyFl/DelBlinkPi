#!/bin/bash

# Make blink1 flash orange for 10 seconds
blink1-tool --delay 1000 --rgb 255,136,0  --blink 10


# Use DD to securely erase the disk 7 times with random numbers
for _ in {1..7}; do
    # Make blink1 flash green while secure erase, if secure erase fails blink1 flashs red
    blink1-tool --delay 1000 --rgb 255,136,0  --blink 0 | sudo dd if=/dev/zero of=/dev/sda bs=1M status=progress ||     blink1-tool --delay 1000 --red  --blink 0
done

# Make blink1 green when erase is completed successfully
blink1-tool --green
