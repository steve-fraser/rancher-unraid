docker run -d --name='rancher' --net='host' \
    --privileged=true \
    -e TZ="America/Los_Angeles" \
    -e HOST_OS="Unraid" \
    -e UNRAID_SERVER="192.168.7.67" \
    -v '/mnt/disk1/appdata/rancher':'/var/lib/rancher':'rw' \
    --restart=unless-stopped \
    stevenfraser/rancher-unraid:latest
 #   stevenfraser/rancher-unraid:latest

    -e UNRAID_NFS_SHARE=/mnt/user/rancher \

rm -R /mnt/disk1/rancher/*
rm -R /mnt/disk1/appdata/rancher