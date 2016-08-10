#!/bin/sh

echo "Switching to backup system..."
echo "" 
RESCUE_DEV=/dev/mtdblock1
RESCUE_TYPE="-t jffs2"

for arg in $(cat /proc/cmdline); do
   case $arg in
     rescue\=*)
          RESCUE_DEV="`echo $arg | awk -F"rescue=" '{print $2}' | awk -F" " '{print $1}'`"
          ;;
     rescue_type\=*)
          RESCUE_TYPE="-t `echo $arg | awk -F"rescue_type=" '{print $2}' | awk -F" " '{print $1}'`"
          ;;
   esac
done


mkdir -p /mnt/rescRO
mkdir -p /mnt/rescRW
mkdir -p /mnt/rescue

mount $RESCUE_TYPE -o ro  $RESCUE_DEV  /mnt/rescRO 
mount -t tmpfs -o size=50% rescRW /mnt/rescRW
mkdir -p /mnt/rescRW/upper
mkdir -p /mnt/rescRW/work

mount -t overlay -o lowerdir=/mnt/rescRO,upperdir=/mnt/rescRW/upper,workdir=/mnt/rescRW/work rescue /mnt/rescue

/usr/bin/systemctl --no-block --force switch-root /mnt/rescue





