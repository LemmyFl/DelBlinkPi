#!/bin/bash

##echo "USB device added at $(date)" >> "sudo curl https://raw.githubusercontent.com/LemmyFl/DelBlinkPi/main/diskdeleteinstall.sh | bash"

# Make blink1 flash orange for 10 seconds
blink1-tool --delay 500 --rgb 255,136,0  --blink 20

# Use DD to securely erase the disk 7 times with random numbers
##for _ in {1..7}; do
    # Make blink1 flash orange while secure erase, if secure erase fails blink1 flashs red
    blink1-tool --delay 1000 --rgb 255,136,0  --blink 0 | sudo find /dev/ -name "sd*" -exec dd if=/dev/urandom of={} bs=1M status=progress \; || blink1-tool --delay 1000 --red  --blink 0
##done

# Make blink1 green when erase is completed successfully
blink1-tool --green
