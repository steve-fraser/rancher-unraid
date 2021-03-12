FROM rancher/rancher:stable
#INSTALL DRIVER DEPENDENCIES
RUN apt update \
  && apt-get --assume-yes install libvirt-clients \
  && apt-get --assume-yes install nfs-common 
 
CMD null
#COPY THE JAILER FILE THAT MOUNTS THE UNRAID SERVER TO PASS THE DISK AN ISO
#COPY jailer.sh /usr/bin/jailer.sh
#RUN chmod +x /usr/bin/jailer.sh