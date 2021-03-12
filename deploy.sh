docker run -d --name='rancher-test' --net='host' \
    --privileged=true \
    -e TZ="America/Los_Angeles" \
    -e HOST_OS="Unraid" \
    -e UNRAID_SERVER="192.168.7.67" \
    -e UNRAID_NFS_SHARE=/mnt/user/rancher \
    -v '/mnt/disk1/appdata/rancher-test':'/var/lib/rancher':'rw' \
    --restart=unless-stopped \
    stevenfraser/rancher-unraid:latest
#-e UNRAID_NFS_SHARE=/mnt/user/rancher \
apt update \
    && apt-get --assume-yes install libvirt-clients \
    && apt-get --assume-yes install nfs-common \
    && curl -L https://raw.githubusercontent.com/steve-fraser/rancher-unraid/main/jailer.sh > /usr/bin/jailer.sh \
    && chmod +x /usr/bin/jailer.sh

helm install nginx nginx-stable/nginx-ingress
curl -k --resolve sonarr.stevefraser.dev:443:192.168.7.85 https://sonarr.stevefraser.dev:443/login/login
curl -k --resolve sonarr.stevefraser.dev:443:192.168.39.237 https://sonarr.stevefraser.dev:443/login/login
curl -vk --resolve sonarr.stevefraser.dev:30403:192.168.39.237 https://sonarr.stevefraser.dev:30403/login/login

helm uninstall nginx

docker save -o pause.tar docker.io/rancher/pause:3.1

sudo /usr/local/bin/k3s ctr i pull docker.io/rancher/pause:3.1