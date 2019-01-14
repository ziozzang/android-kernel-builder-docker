#!/bin/bash

#- Build for Android Kernel Build Env.
docker build -t android-build-tools:latest .

#- Clone Android Kernel Sources
#>> code id for franco kernel (Poco F1)
git clone https://github.com/franciscofranco/beryllium.git

#- Copy Build Scripts
cp -f ./build.sh ./beryllium/

#- Mount And Build It
#>> DEF_CONFIG is on under arch/arm64/config
#   this is specfied by developer.
DEF_CONFIG="franco_defconfig"

docker run \
        -it --rm \
        --privileged=true \
        --volume $(pwd)/beryllium:/kernel \
        --workdir=/kernel --entrypoint=/kernel/run_in_docker.sh android-build-tools ${DEF_CONFIG}
