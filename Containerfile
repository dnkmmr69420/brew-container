FROM      registry.fedoraproject.org/fedora-toolbox:latest

LABEL com.github.containers.toolbox="true" \
      usage="This image is meant to be used with the toolbox or distrobox command" \
      summary="brew in a container" \
      maintainer="dnkmmr"

RUN      dnf -y upgrade

RUN      dnf install -y patchelf make gcc file bash-completion bc bzip2 cracklib-dicts curl diffutils dnf-plugins-core findutils glibc-all-langpacks glibc-locale-source gnupg2 gnupg2-smime hostname iproute iputils keyutils krb5-libs less lsof man-db man-pages mtr ncurses nss-mdns openssh-clients pam passwd pigz pinentry procps-ng rsync shadow-utils sudo tcpdump time traceroute tree tzdata unzip util-linux vte-profile wget which whois words xorg-x11-xauth xz zip mesa-dri-drivers mesa-vulkan-drivers vulkan

RUN      rm -rf /etc/sudoers
COPY      ./config/sudoers /etc/sudoers

RUN      mkdir -p /usr/local/lib/cbrew
COPY      ./bin/init-brew /usr/local/bin
COPY      ./bin/brew-export /usr/local/bin
COPY      ./profile.d/brew.sh /etc/profile.d
COPY      ./systemd/brew-container.service /usr/local/lib/cbrew
RUN      chmod +x /usr/local/bin/init-brew
RUN      chmod +x /usr/local/bin/brew-export
     
RUN      ln -sf /home/linuxbrew/.linuxbrew /brew
