#!/bin/bash
rm output/system/lib/modules/*.ko
rm output/kernel/zImage
make CROSS_COMPILE=android-toolchain-eabi/bin/arm-eabi- clean
make CROSS_COMPILE=android-toolchain-eabi/bin/arm-eabi- mrproper
make CROSS_COMPILE=android-toolchain-eabi/bin/arm-eabi- elite_defconfig
make CROSS_COMPILE=android-toolchain-eabi/bin/arm-eabi- -j9
cp arch/arm/boot/zImage output/kernel/zImage
find . -name '*.ko' -exec cp {} output/system/lib/modules/  \;
NOW=$(date +"%m-%d-%y")
zip -r test_Kernel-"$NOW".zip *
