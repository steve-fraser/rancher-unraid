FROM rancher/rancher:v2.4.13

# apt update \
#     && apt-get --assume-yes install libvirt-clients \
#     && apt-get --assume-yes install nfs-common \
#     && curl -L https://raw.githubusercontent.com/steve-fraser/docker-machine-kvm/master/jailer.sh > /usr/bin/jailer.sh \
#     && chmod +x /usr/bin/jailer.sh
RUN apt update \
  && apt-get --assume-yes install libvirt-clients \
  && apt-get --assume-yes install nfs-common \

COPY jailer.sh /usr/bin/jailer.sh
RUN chmod +x /usr/bin/jailer.sh