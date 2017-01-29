AP_BIN_DIR="/home/pi/ardupilot/bin/"
VEHICLE_BIN="ArduCopter.elf"

RPIPROC=$(cat /proc/cpuinfo |grep "Hardware" | awk '{print $3}')
if [ "$RPIPROC" = "BCM2708" ]; then
        echo "Raspberry Pi 1/0"
        GPS="/dev/ttyAMA0"
elif [ -c /dev/ttyS0 ]; then
        echo "Raspberry Pi 3"
        GPS="/dev/ttyS0"
else
        echo "Raspberry pi 2"
        GPS="/dev/ttyAMA0"
fi

FLAGS="-l /home/pi/ardupilot/logs -t /home/pi/ardupilot/terrain/"
while :; do
         export mavproxy=1
         export picam=1
         cd $AP_BIN_DIR
         $AP_BIN_DIR/$VEHICLE_BIN -A udp:$1:14550 -B $GPS $FLAGS
         cd -
done >> /home/pi/ardupilot/info/ardupilot.log 2>&1

