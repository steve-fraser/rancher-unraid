# rancher-unraid
This container image is build on top of the rancher/rancher project to create an Unraid compatiable kvm rancher server. This container contains the https://github.com/steve-fraser/docker-machine-kvm driver. Please see this driver documentation for further details for configurating rancher templates.

Requirements Current
- Unraid PUBLIC NFS Share (no auth currently)
- Libvirtd on the Unraid host to be configured to allow TCP connections (please see the medium post).
- Docker container deployed directly onto Unraid host
- Host networking
- Privilged container (rancher requirement)

| Parameter | Function |
| :----: | --- |
| `UNRAID_SERVER` | Unraid server IP Address |
| `UNRAID_NFS_SHARE` | Unraid share location |

Please see the example run command.
```
docker run -d --name='rancher' --net='host' \
    --privileged=true \
    -e TZ="America/Los_Angeles" \
    -e HOST_OS="Unraid" \
    -e UNRAID_SERVER="127.0.0.1" \
    -e UNRAID_NFS_SHARE=/mnt/user/rancher \
    -v '/mnt/disk1/appdata/rancher':'/var/lib/rancher':'rw' \
    --restart=unless-stopped \
    stevenfraser/rancher-unraid:latest
```