#!/bin/sh

if [ -z "$HOST_IP" ]; then
  ip=`hostname -i`
else
  ip=`echo $HOST_IP`
fi

echo "ip address = $ip"

sed -i "s/139.196.213.170/${ip}/" /etc/fdfs/storage.conf

/usr/bin/fdfs_trackerd /etc/fdfs/tracker.conf restart
/usr/bin/fdfs_storaged /etc/fdfs/storage.conf restart
/usr/sbin/nginx -g 'daemon off;'
