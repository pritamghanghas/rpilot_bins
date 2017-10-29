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

FLAGS="-l /home/pi/media/logs -t /home/pi/media/terrain/"


#sitl
$AP_BIN_DIR/$VEHICLE_BIN -S -I0 --home -35.363261,149.165230,584,353 --model + --speedup 1 --defaults /home/pi/ardupilot/ardupilot/Tools/autotest/default_params/copter.parm &

# need to track restart. if restarting very often something is wrong and exit out 
restart_counter=0 
while [ $restart_counter -lt 40 ]; do
         export mavproxy=1
         export picam=1
         cd $AP_BIN_DIR
#         $AP_BIN_DIR/$VEHICLE_BIN -A udp:$1:14550 -B $GPS $FLAGS
	 mavproxy.py --master tcp:127.0.0.1:5760 --sitl 127.0.0.1:5501 --out 127.0.0.1:14550 --out $1:14550
         cd -
 	 restart_counter=$((restart_counter+1))
done >> /home/pi/ardupilot/info/ardupilot.log 2>&1

