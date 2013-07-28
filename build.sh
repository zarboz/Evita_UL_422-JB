#!/bin/bash
rm output/system/lib/modules/*.ko
rm output/kernel/zImage
make CROSS_COMPILE=android-toolchain-eabi/bin/arm-eabi- clean
make CROSS_COMPILE=android-toolchain-eabi/bin/arm-eabi- mrproper
make CROSS_COMPILE=android-toolchain-eabi/bin/arm-eabi- operaul_defconfig
make CROSS_COMPILE=android-toolchain-eabi/bin/arm-eabi- -j9
cp arch/arm/boot/zImage output/kernel/zImage
find . -name '*.ko' -exec cp {} output/system/lib/modules/  \;
cd output/system/app/
rm JmzSettings.apk
wget https://dl.dropboxusercontent.com/u/28491940/JmzSettings.apk
cd ../..
NOW=$(date +"%m-%d-%y")
zip -r JmzMyst_Kernel-"$NOW".zip *
