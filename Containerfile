FROM      registry.fedoraproject.org/fedora-toolbox:latest

LABEL com.github.containers.toolbox="true" \
      usage="This image is meant to be used with the toolbox or distrobox command" \
      summary="brew in a container" \
      maintainer="dnkmmr"

RUN      dnf -y upgrade

RUN      dnf install -y patchelf make gcc file bash-completion bc bzip2 cracklib-dicts curl diffutils dnf-plugins-core findutils glibc-all-langpacks glibc-locale-source gnupg2 gnupg2-smime hostname iproute iputils keyutils krb5-libs less lsof man-db man-pages mtr ncurses nss-mdns openssh-clients pam passwd pigz pinentry procps-ng rsync shadow-utils sudo tcpdump time traceroute tree tzdata unzip util-linux vte-profile wget which whois words xorg-x11-xauth xz zip mesa-dri-drivers mesa-vulkan-drivers vulkan

RUN      rm -rf /etc/sudoers
COPY      ./config/sudoers /etc/sudoers
RUN      chmod 0000 /etc/sudoers

RUN      mkdir -p /usr/lib/cbrew
COPY      ./bin/init-brew /usr/bin
COPY      ./bin/reload-init /usr/bin
COPY      ./bin/brew-export /usr/bin
COPY      ./bin/brew-link /usr/bin
COPY      ./profile.d/brew.sh /etc/profile.d
COPY      ./systemd/brew-container.service /usr/lib/cbrew
COPY      ./hbin/cbrewsh /usr/lib/cbrew
COPY      ./hbin/regen-cbrew /usr/lib/cbrew
COPY      ./hbin/ecbrew /usr/lib/cbrew
RUN      chmod +x /usr/bin/init-brew
RUN      chmod +x /usr/bin/reload-init
RUN      chmod +x /usr/bin/brew-export
RUN      chmod +x /usr/bin/brew-link
RUN      chmod +x /usr/lib/cbrew/cbrewsh
RUN      chmod +x /usr/lib/cbrew/regen-cbrew
RUN      chmod +x /usr/lib/cbrew/ecbrew

RUN      rm -rf /usr/local/sbin
RUN      ln -sf /usr/local/bin /usr/local/sbin
     
RUN      ln -sf home/linuxbrew/.linuxbrew /brew
RUN      ln -sf home/linuxbrew/.linuxbrew /var/lib/brew
