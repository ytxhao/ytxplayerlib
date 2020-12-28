#!/bin/bash

# ANDROID_NDK_HOME=/home/vagrant/Android/android-ndk-r21d
# ANDROID_NDK_HOME=$(echo $ANDROID_NDK_HOME)
YTXPLAYER_PATH=$(git rev-parse --show-toplevel)
HOST_TAG=linux-x86_64
API=26
ABI=
ARCH=
TARGET=
TARGET_TOOL=

fun_build_clean() {
  echo "build target clean"
  make clean
}

fun_build_config_armv7a() {
  echo "build target armv7a config"
  # Application Binary Interface (ABI)
  ABI=armeabi-v7a
  ARCH=arm
  TARGET=armv7a-linux-androideabi
  TARGET_TOOL=arm-linux-androideabi
}

fun_build_config_arm64() {
  echo "build target arm64 config"
  # Application Binary Interface (ABI)
  ABI=arm64-v8a
  ARCH=arm64
  TARGET=aarch64-linux-android
  TARGET_TOOL=aarch64-linux-android
}

fun_build_config_x86() {
  echo "build target x86 config"
  # Application Binary Interface (ABI)
  ABI=x86
  ARCH=x86
  TARGET=i686-linux-android
  TARGET_TOOL=i686-linux-android
}

fun_build_config_x86_64() {
  echo "build target x86_64 config"
  # Application Binary Interface (ABI)
  ABI=x86_64
  ARCH=x86_64
  TARGET=x86_64-linux-android
  TARGET_TOOL=x86_64-linux-android
}

if [ "$1" = "clean" ]; then
  fun_build_clean
  exit 0
fi

if [ "$1" = "-armv7a" ] || [ "$2" = "-armv7a" ]; then
  fun_build_config_armv7a
fi

if [ "$1" = "-arm64" ] || [ "$2" = "-arm64" ]; then
  fun_build_config_arm64
fi

if [ "$1" = "-x86" ] || [ "$2" = "-x86" ]; then
  fun_build_config_x86
fi

if [ "$1" = "-x86_64" ] || [ "$2" = "-x86_64" ]; then
  fun_build_config_x86_64
fi

PLATFORM=${ANDROID_NDK_HOME}/platforms/android-${API}/arch-${ARCH}
PREBUILT=${ANDROID_NDK_HOME}/toolchains/llvm/prebuilt
prefix=${YTXPLAYER_PATH}/build/output/jniLibs/${ABI}
CROSS_COMPILE=${PREBUILT}/${HOST_TAG}/bin/${TARGET}${API}-
INC=-I${prefix}/include
XLDFLAGS=-L${prefix}/lib
CC="${CROSS_COMPILE}clang --sysroot=${ANDROID_NDK_HOME}/toolchains/llvm/prebuilt/${HOST_TAG}/sysroot"

LD=${PREBUILT}/${HOST_TAG}/bin/${TARGET_TOOL}-ld
AR=${PREBUILT}/${HOST_TAG}/bin/${TARGET_TOOL}-ar

echo "ANDROID_NDK_HOME=$ANDROID_NDK_HOME" >Makefile
echo "YTXPLAYER_PATH=$YTXPLAYER_PATH" >>Makefile
echo "HOST_TAG=$HOST_TAG" >>Makefile
echo "API=$API" >>Makefile
echo "ABI=$ABI" >>Makefile
echo "ARCH=$ARCH" >>Makefile
echo "TARGET=$TARGET" >>Makefile
echo "PLATFORM=$PLATFORM" >>Makefile
echo "PREBUILT=$PREBUILT" >>Makefile
echo "prefix=$prefix" >>Makefile
echo "CROSS_COMPILE=$CROSS_COMPILE" >>Makefile
echo "INC=$INC" >>Makefile
echo "XLDFLAGS=$XLDFLAGS" >>Makefile
echo "CC=$CC" >>Makefile
echo "LD=$LD" >>Makefile
echo "AR=$AR" >>Makefile

FILENAME=Makefile.in
IFS_OLD=$IFS
IFS=""
while read -r line; do
  echo "$line" >>Makefile
done <"$FILENAME"
IFS=$IFS_OLD

make || exit 1
make install || exit 1
