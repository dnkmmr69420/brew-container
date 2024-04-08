# Brew Container

A distrobox (docker) image that is used for homebrew. The `/home/linuxbrew` will be mounted to a directory in ~/ so it will be safe if you regenerate or delete the container.

## Installation

Install distrobox if you don't havw it first then run this command

```bash
distrobox create -i ghcr.io/dnkmmr69420/brew:latest -n brew-container -p
```
