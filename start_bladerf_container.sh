docker volume create readsbpb_rrd
docker volume create readsbpb_autogain
docker run \
 -d \
 -it \
 --restart=always \
 --name readsb \
 --hostname readsb \
 --device /dev/bus/usb/001/003:/dev/bus/usb/001/003 \
 -p 8080:8080 \
 -p 30005:30005 \
 -e TZ=US/New_York \
 -e READSB_DCFILTER=true \
 -e READSB_DEVICE_TYPE=ubladerf \
 -e READSB_FIX=true \
 -e READSB_GAIN=autogain \
 -e READSB_LAT=39.2037 \
 -e READSB_LON=-76.8610 \
 -e READSB_MODEAC=true \
 -e READSB_RX_LOCATION_ACCURACY=2 \
 -e READSB_STATS_RANGE=true \
 -e READSB_NET_ENABLE=true \
 -e DISABLE_PERFORMANCE_GRAPHS=1 \
 -v readsbpb_autogain:/run/autogain \
 -v readsbpb_rrd:/run/collectd \
 kent
