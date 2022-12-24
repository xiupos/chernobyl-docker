FROM i386/debian:buster-slim

ARG WINEVERSION="5.0"

ENV WINEVERSION=$WINEVERSION
ENV WINEHOME="/root"
ENV WINEPREFIX="$WINEHOME/.wine32"
ENV WINEARCH="win32"

RUN export DEBIAN_FRONTEND=noninteractive \
  && dpkg --add-architecture i386 \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    telnet \
    cabextract \
    gnupg2 \
    wget \
    unzip \
  && mkdir -p $WINEPREFIX \
  && wget https://dl.winehq.org/wine-builds/winehq.key -O - | apt-key add - \
  && echo "deb https://dl.winehq.org/wine-builds/debian buster main" > /etc/apt/sources.list.d/winehq.list \
  && wget https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/Debian_10/Release.key -O - | apt-key add - \
  && echo "deb https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/Debian_10 ./" > /etc/apt/sources.list.d/obs.list \
  && { \
    echo "Package: *wine* *wine*:i386"; \
    echo "Pin: version $WINEVERSION~buster"; \
    echo "Pin-Priority: 1001"; \
    } > /etc/apt/preferences.d/winehq.pref \
  && apt-get update \
  && apt-get install -y --no-install-recommends winehq-stable \
  && wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks -O /usr/bin/winetricks \
  && chmod +rx /usr/bin/winetricks \
  && apt purge --auto-remove -y \
  && apt autoremove --purge -y \
  && rm -rf /var/lib/apt/lists/* \
  && wget https://web.archive.org/web/20201101221525/https://www.simgenics.com/downloads/Chernobyl_Installer.zip \
  && wget https://web.archive.org/web/20210201092558/https://www.simgenics.com/downloads/chernobyl04.zip \
  && unzip Chernobyl_Installer.zip && rm Chernobyl_Installer.zip \
  && unzip chernobyl04.zip && rm chernobyl04.zip \
  && mkdir /chernobyl && mv /Chernobyl\ Installer/Installer /chernobyl/installer && rm -rf /Chernobyl\ Installer/ \
  && mv chernobyl04.ICD /chernobyl
