#!/bin/bash
BUILD_DEFCONFIG=${1:-""}
if [ -z "${BUILD_DEFCONFIG}" ]; then
  echo "no defconfig error"
  exit 1
fi

OUTPUT_DIR="./output"
echo "Bulding with DEFCONFIG='${BUILD_DEFCONFIG}'"
echo ">> clean"
make clean
echo "<< clean"
mkdir -p ${OUTPUT_DIR}
echo ">> mrproper"
make mrproper
echo "<< mrproper"
echo ">> config"
make O=${OUTPUT_DIR} ${BUILD_DEFCONFIG}
echo "<< config"
echo ">> build"
make O=${OUTPUT_DIR} -j$(nproc --all)
echo "<< build"
