FROM ubuntu:18.04
LABEL Jioh L. Jung <ziozzang@gmail.com>

# This is for in Korean only(for speed up...)
#RUN sed -i 's/archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list

RUN apt update && apt upgrade -fy
RUN apt install -y git openjdk-8-jdk git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache libgl1-mesa-dev libxml2-utils xsltproc unzip python bc liblz4-tool vboot-utils vim u-boot-tools device-tree-compiler wget zsh tmux
RUN git clone https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9 -b o-preview /toolchain/o/
ENV CROSS_COMPILE=/toolchain/o/bin/aarch64-linux-android-
ENV ARCH=arm64
COPY mkbootimg /bin/mkbootimg
RUN chmod u+x /bin/mkbootimg

# Install Oh My Zsh!
RUN sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" || true

ENTRYPOINT zsh
