#!/bin/bash
#- Source code clone
git clone https://github.com/franciscofranco/beryllium.git beryllium_franco

#- DEF configuration file
DEF_CONFIG="franco_defconfig"

#- Build with Clang
docker run \
        -it --rm \
        --privileged=true \
        --volume $(pwd)/beryllium_franco:/kernel \
        ziozzang/android-build-tools build_kernel_clang ${DEF_CONFIG}


