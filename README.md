Also check out [Brew User](https://github.com/dnkmmr69420/brew-user/tree/main)

# Brew Container

A distrobox (docker) image that is used for homebrew. The `/home/linuxbrew` will be mounted to a directory in ~/ so it will be safe if you regenerate or delete the container.

## Installation

Install distrobox if you don't have it first then run this command

```bash
distrobox create -i ghcr.io/dnkmmr69420/brew:latest -n brew-container -p
```

### Installation with custom home

```bash
distrobox create -i ghcr.io/dnkmmr69420/brew:latest -n brew-container-custom-home -p -H ~/brew-container
```

## Adding the bin path

Simply put this in your .bashrc file

```bash
export PATH="$HOME/.local/share/clinuxbrew/exports/bin:$PATH"
```

# Commands

## In Container

- init-brew: runs bind mounts and runs 'reload-init' if it hasn't been ran.
- reload-init Installs homebrew if not installed and does some other things as well.
- brew-export: Like `distrobox-export` but makes it easy to export brew bins on the host. -s flag uses brews sbin instead of bin and -r flag makes the exported bin ran as root in the container.
- brew-link: symlinks something in the bin dir to exports/bin. Only works good with certain programs
- [patchelf](https://github.com/NixOS/patchelf): A utility program for modifying existing executables. I also am not the creator of this command.

## On host

- cbrew: runs brew in container
- cbrewsh: shorter version of `distrobox enter brew-container`
- regen-cbrew: Deletes and recreats the container. Useful for updating the container. Note: Brew and its installed programs will be safe since it is stored at `~/.local/share/clinuxbrew`
- ecbrew: runs commands in the brew container

# Symlinks

There are a few symlinks that are created

- /brew A symlink to `/home/linuxbrew/.linuxbrew` for ease to cd in
- /hbrew A symlink to the hosts brew which is `/run/host/home/linuxbrew/.linuxbrew` for it to be easier to cd in

# Dependencies

These need be be on the host in order for this program to work

- Bash (should be preinstalled on nearly every single linux distro)
- [Distrobox](https://github.com/89luca89/distrobox)
- A container mamagement tool either [Docker](https://www.docker.com), [Podman](https://podman.io/), or [lilipod](https://github.com/89luca89/lilipod) (tested on podman).
