FROM i386/alpine:latest

ENV WINEARCH=win32

# Install wine
RUN apk add --no-cache wget unzip wine cabextract \
  && wget  https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks -O /usr/bin/winetricks \
  && chmod +x /usr/bin/winetricks

# Download RBMK-1000 Chernobyl Nuclear Reactor Simulator and patch
RUN wget https://web.archive.org/web/20201101221525/https://www.simgenics.com/downloads/Chernobyl_Installer.zip \
  && wget https://web.archive.org/web/20210201092558/https://www.simgenics.com/downloads/chernobyl04.zip \
  && unzip Chernobyl_Installer.zip && rm Chernobyl_Installer.zip \
  && unzip chernobyl04.zip && rm chernobyl04.zip \
  && mkdir /chernobyl && mv /Chernobyl\ Installer/Installer /chernobyl/installer && rm -rf /Chernobyl\ Installer/ \
  && mv chernobyl04.ICD /chernobyl
