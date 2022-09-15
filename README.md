# ☢️ RBMK-1000 Chernobyl Nuclear Reactor Simulator on Docker 🐳

It works on X11, and depends on docker.

## Run

```bash
docker compose up
# During the first compose-up some install wizards will be appeared.
# DO NOT install:
#   - Mono
# Install:
#   - .NET Framework 3.5
#   - RXMODEL
# These will be installed in `./wine`.
```

NOTE: The simulator *Chernobyl_Installer.zip* and the patch *chernobyl04.zip* will be downloaded from simgenics.com([archive](https://web.archive.org/web/*/https://www.simgenics.com/downloads/*)).

## Patch

Run the following command **after the first compose-up**:

```bash
docker compose run --rm wine bash patch.sh
```

## Uninstall

```bash
# Delete wine data (DO AS SUPERUSER)
sudo rm -rf ./wine

# Delete all images
docker compose down --rmi all --volumes --remove-orphans
```

## Links

- [Chernobyl... The Legacy Continues - Gatekeeper Technology Group, Inc.](https://web.archive.org/web/19981205104314/http://www.gatekeepsw.com/The_Game.html)

- [Chernobyl_The_Legacy_Continues_Information_and_Users_Guide.pdf](https://web.archive.org/web/20210120030954/https://www.simgenics.com/downloads/Chernobyl_The_Legacy_Continues_Information_and_Users_Guide.pdf)

- [RBMK-1000 - Wikipedia](https://ru.wikipedia.org/wiki/%D0%A0%D0%B5%D0%B0%D0%BA%D1%82%D0%BE%D1%80_%D0%B1%D0%BE%D0%BB%D1%8C%D1%88%D0%BE%D0%B9_%D0%BC%D0%BE%D1%89%D0%BD%D0%BE%D1%81%D1%82%D0%B8_%D0%BA%D0%B0%D0%BD%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9#%D0%A0%D0%91%D0%9C%D0%9A-1000)

- [Chernobyl Nuclear Power Plant - Wikipedia](https://ru.wikipedia.org/wiki/%D0%A7%D0%B5%D1%80%D0%BD%D0%BE%D0%B1%D1%8B%D0%BB%D1%8C%D1%81%D0%BA%D0%B0%D1%8F_%D0%90%D0%AD%D0%A1)

- [RBMK Reactor Simulator... think you can avoid a meltdown/explosion? : chernobyl](https://www.reddit.com/r/chernobyl/comments/bu8obn/comment/eqrz6zn/)

- [チェルノブイリ原発シミュレーター・Tips - おめが？日記_(2)](https://omega.hatenadiary.jp/entry/2021/01/28/214431)
