Also check out [Brew User](https://github.com/dnkmmr69420/brew-user/tree/main)

# Brew Container

A distrobox (docker) image that is used for homebrew. The `/home/linuxbrew` will be mounted to a directory in ~/ so it will be safe if you regenerate or delete the container.

## Installation

Install distrobox if you don't havw it first then run this command

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
