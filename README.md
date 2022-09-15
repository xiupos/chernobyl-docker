# RBMK-1000 Chernobyl Nuclear Reactor Simulator on Docker

It works on X11, and depends on docker.

## Run

```bash
docker compose up

# You DON'T have to install Mono.
# You MUST install .NET Framework 3.5.
# You MUST install RXMODEL.
```

- *Chernobyl_Installer.zip* and *chernobyl04.zip* will be downloaded from [archive.org](https://web.archive.org/web/*/https://www.simgenics.com/downloads/*).
- During the first compose-up the simulator will be installed.

## [Patch](https://www.reddit.com/r/chernobyl/comments/bu8obn/comment/eqrz6zn/)

Run the following command after the first compose-up:

```bash
docker compose run wine bash patch.sh
```

## Uninstall

```bash
# Delete wine data (DO AS SUPERUSER)
sudo rm -rf ./wine

# Delete all images
docker compose down --rmi all --volumes --remove-orphans
```
