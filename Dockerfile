FROM ubuntu:18.04
LABEL Jioh L. Jung <ziozzang@gmail.com>

ENV CROSS_COMPILE=/toolchain/gcc/bin/aarch64-linux-android-
ENV ARCH=arm64

# This is for in Korean only(for speed up...)
RUN sed -i 's/archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list

RUN mkdir -p /kernel

RUN apt update && apt upgrade -fy && \
    apt install -y \
      git openjdk-8-jdk git-core gnupg flex bison gperf build-essential zip \
      curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev \
      x11proto-core-dev libx11-dev lib32z-dev ccache libgl1-mesa-dev libxml2-utils \
      xsltproc unzip python bc liblz4-tool vboot-utils vim u-boot-tools \
      device-tree-compiler wget zsh tmux

#- This is for GCC
#RUN git clone https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9 -b pie-release /toolchain/gcc/
RUN mkdir -p /toolchain/gcc/ && \
    cd /toolchain/gcc/ && \
    curl https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/+archive/pie-release.tar.gz | tar xvz

#- This is for Clang
#RUN git clone https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86 -b pie-release /toolchain/clang/
RUN cd /toolchain/ && \
    curl https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86/+archive/pie-release.tar.gz | tar xvz clang-4691093 && \
    ln -s clang-4691093 clang

#- Add mkbootimg
COPY mkbootimg /bin/mkbootimg
RUN chmod u+x /bin/mkbootimg

#- This is for Builder scripts
COPY build_kernel_* /usr/bin/

# Install Oh My Zsh!
RUN sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" || true
WORKDIR /kernel
ENTRYPOINT zsh
