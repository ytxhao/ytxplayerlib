#!/bin/bash

# ANDROID_NDK_HOME=/home/vagrant/Android/android-ndk-r21d
# ANDROID_NDK_HOME=$(echo $ANDROID_NDK_HOME)
YTXPLAYER_PATH=$(git rev-parse --show-toplevel)
HOST_TAG=linux-x86_64
API=26
# Application Binary Interface (ABI)
ABI=arm64-v8a
ARCH=arm64
CPU=armv8-a
TARGET=aarch64-linux-android

PLATFORM=${ANDROID_NDK_HOME}/platforms/android-26/arch-arm64
PREBUILT=${ANDROID_NDK_HOME}/toolchains/llvm/prebuilt
prefix=${YTXPLAYER_PATH}/build/output/jniLibs/${ABI}
CROSS_COMPILE=${PREBUILT}/${HOST_TAG}/bin/${TARGET}${API}-
INC=-I${prefix}/include
XLDFLAGS=-L${prefix}/lib
CC="${CROSS_COMPILE}clang --sysroot=${ANDROID_NDK_HOME}/toolchains/llvm/prebuilt/${HOST_TAG}/sysroot"

LD=${PREBUILT}/${HOST_TAG}/bin/${TARGET}-ld
AR=${PREBUILT}/${HOST_TAG}/bin/${TARGET}-ar


echo "ANDROID_NDK_HOME=$ANDROID_NDK_HOME" > Makefile
echo "YTXPLAYER_PATH=$YTXPLAYER_PATH" >> Makefile
echo "HOST_TAG=$HOST_TAG" >> Makefile
echo "API=$API" >> Makefile
echo "ABI=$ABI" >> Makefile
echo "ARCH=$ARCH" >> Makefile
echo "CPU=$CPU" >> Makefile
echo "TARGET=$TARGET" >> Makefile
echo "PLATFORM=$PLATFORM" >> Makefile
echo "PREBUILT=$PREBUILT" >> Makefile
echo "prefix=$prefix" >> Makefile
echo "CROSS_COMPILE=$CROSS_COMPILE" >> Makefile
echo "INC=$INC" >> Makefile
echo "XLDFLAGS=$XLDFLAGS" >> Makefile
echo "CC=$CC" >> Makefile
echo "LD=$LD" >> Makefile
echo "AR=$AR" >> Makefile


FILENAME=Makefile.in
IFS_OLD=$IFS 
IFS=""
while read -r line
do
echo "$line" >> Makefile
done < "$FILENAME"
IFS=$IFS_OLD



make 
make install