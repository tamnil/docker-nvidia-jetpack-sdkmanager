FROM ubuntu:20.04

ARG USER_ID
ARG GROUP_ID

# Add user to sudoers
RUN apt-get update && apt-get install -y sudo
# RUN adduser --disabled-password --gecos '' --disabled-password --uid $USER_ID --gid $GROUP_ID user
RUN useradd -m user && echo "user:user" | chpasswd && adduser user sudo
#RUN addgroup --gid $GROUP_ID user
#RUN adduser user sudo
RUN usermod -a -G sudo user
RUN echo 'user ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER user

# Install SDK deps
RUN sudo apt-get update && sudo DEBIAN_FRONTEND=noninteractive  apt-get install -y \
    libgconf-2-4 \
    libcanberra-gtk-module \
    locales \
    netcat \
    openssh-server \
    usbutils \
    libgtk-3-0 \
    libx11-xcb-dev \
    libxss-dev \
    libnss3 \
    libcanberra-gtk-module \
    libcanberra-gtk3-module \
    nodejs \
    firefox \
    npm

COPY sdkmanager_1.9.2-10899_amd64.deb /
COPY entrypoint.sh /entrypoint.sh
RUN sudo apt-get install -y /sdkmanager_1.9.2-10899_amd64.deb

ENTRYPOINT [ "/entrypoint.sh" ]
