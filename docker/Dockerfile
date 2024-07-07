FROM debian:bookworm

RUN mkdir /setup
WORKDIR /setup
COPY install-devkitpro-pacman.sh ./

# Update the Debian image
RUN apt update && apt upgrade --yes
RUN apt install wget cmake git --yes

# Install DevKitPro Pacman
RUN chmod +x ./install-devkitpro-pacman.sh
RUN ./install-devkitpro-pacman.sh
RUN ln -s /proc/self/mounts /etc/mtab

# Install the DevKitPro groups we want to use
RUN dkp-pacman -Syu --needed --noconfirm wiiu-dev

# Update the path to include the build tools
ENV DEVKITPRO=/opt/devkitpro
ENV DEVKITARM=${DEVKITPRO}/devkitARM
ENV DEVKITPPC=${DEVKITPRO}/devkitPPC
ENV PATH=${DEVKITPRO}/tools/bin:$PATH
ENV PATH=${DEVKITPRO}/portlibs/wiiu/bin:$PATH

WORKDIR /src

# Prevent the container from quitting automatically
ENTRYPOINT ["tail", "-f", "/dev/null"]
