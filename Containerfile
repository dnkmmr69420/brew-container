FROM      registry.fedoraproject.org/fedora-toolbox:latest

LABEL com.github.containers.toolbox="true" \
      usage="This image is meant to be used with the toolbox or distrobox command" \
      summary="brew in a container" \
      maintainer="dnkmmr"

RUN      dnf -y upgrade

RUN      dnf install -y patchelf make gcc

RUN   ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/docker && \
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/flatpak && \ 
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/podman && \
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/rpm-ostree && \
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/transactional-update

COPY      ./bin/init-brew /usr/local/bin
COPY      ./profile.d/brew.sh /etc/profile.d
RUN      chmod +x /usr/local/bin/init-brew

     
