#/bin/bash
##sudo apt update
##Make blink1 blink orange for 10 seconds before erasing


##blink1-tool --delay 1000 --rgb 255,136,0  --blink 10

##blink1-tool --red

##sleep 5

# Use DD to securely erase the disk 7 times with random numbers
for i in {1..7}; do
    sudo dd if=/dev/zero of=/dev/sda bs=1M status=progress
    if [ $? -ne 0 ]; then 
    'blink1-tool --delay 1000 --red  --blink 0'
    break
    fi
done
done

# Make blink1 green when erase is completed successfully
sleep 5
blink1-tool --green
