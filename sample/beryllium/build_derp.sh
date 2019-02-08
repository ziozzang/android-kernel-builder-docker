#!/bin/bash
#- Source code clone
git clone https://github.com/akhilnarang/beryllium.git beryllium_derp

#- DEF configuration file
DEF_CONFIG="beryllium_defconfig"

#- Build with Clang
docker run \
        -it --rm \
        --privileged=true \
        --volume $(pwd)/beryllium_derp:/kernel \
        --entrypoint=bash \
        ziozzang/android-build-tools -c "build_kernel_clang ${DEF_CONFIG}"

