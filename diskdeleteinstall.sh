#/bin/bash
# Make blink1 blink orange for 10 seconds before erasing
##blink1-tool --delay 1000 --rgb 255,136,0  --blink 10

blink1-tool --red

# Use DD to securely erase the disk 7 times
for i in {1..7}; do
    blink1-tool --red
    dd if=/dev/urandom of=/dev/sda1 bs=1M status=progress
    if  [$? -ne 0 ]; then
        #Make blink1 blink red if there is an error
        blink1-tool --delay 1000 --red  --blink 0
        echo "Error erasing disk"
        break
    fi
done

# Make blink1 green when erase is completed successfully
blink1-tool --green
