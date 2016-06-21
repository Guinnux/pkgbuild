#/usr/bin/sh

echo "Switching to backup system..."
echo "" 

mkdir -p /mnt/rescRO
mkdir -p /mnt/rescRW
mkdir -p /mnt/rescue

mount -t jffs2 -o ro  /dev/mtdblock1  /mnt/rescRO 
mount -t tmpfs -o size=50% rescRW /mnt/rescRW
mkdir -p /mnt/rescRW/upper
mkdir -p /mnt/rescRW/work

mount -t overlay -o lowerdir=/mnt/rescRO,upperdir=/mnt/rescRW/upper,workdir=/mnt/rescRW/work rescue /mnt/rescue

/usr/bin/systemctl --no-block --force switch-root /mnt/rescue


