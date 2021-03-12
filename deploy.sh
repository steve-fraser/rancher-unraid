docker run -d --name='rancher-test' --net='host' \
    --privileged=true \
    -e TZ="America/Los_Angeles" \
    -e HOST_OS="Unraid" \
    -e UNRAID_SERVER="192.168.7.67" \
    -e UNRAID_NFS_SHARE=/mnt/user/rancher \
    -v '/mnt/disk1/appdata/rancher-test':'/var/lib/rancher':'rw' \
    --restart=unless-stopped \
    stevenfraser/rancher-unraid:dev