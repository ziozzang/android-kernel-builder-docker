# Tl;DR
://www.clien.net/service/board/park/13138836?od=T31&po=0&category=&groupCd=eryllium_defconfig"
* android-kernel-builder-docker
  * Dockerized Android Kernel build Environments.
  * build with GCC or Clang (latest prebuilt AOSP env.)
  * worked on any Docker environments.

# Author
* Jioh L. Jung <ziozzang@gmail.com>

# Usages
## Build
* Prerequisit
  * Must be mounted kernel git source at "/kernel"
  * or clone at any directory.

* Build with gcc

```
docker run \
        -it --rm \
        --privileged=true \
        --volume $(pwd)/derp:/kernel \
        --entrypoint=bash \
        ziozzang/android-build-tools -c "build_kernel_gcc beryllium_defconfig"
```

* Build with Clang

```
docker run \
        -it --rm \
        --privileged=true \
        --volume $(pwd)/derp:/kernel \
        --entrypoint=bash \
        ziozzang/android-build-tools -c "build_kernel_gcc beryllium_defconfig"
```

* Build inside container

```
# default shell will be zsh.
docker run \
        -it --rm \
        --privileged=true \
        --volume $(pwd)/derp:/kernel \
        ziozzang/android-build-tools

# Inside container
git clone ........
build_kernel_gcc some_predefined_defconfig

# or...
build_kernel_clang some_predefined_defconfig

```

* second parameter is generally provided by kernel developer.
  * for example Franco Kernel for Pocophone F1 is 'franco_defconfig'
  * for qualcomm or MTK, configuration is exised on "./arch/arm64/configs/"

## Boot with Android Devices
```
fastboot boot zImage
```

# Test
Tested with Poco F1/FrancoKernel, Poco F1/Derp

