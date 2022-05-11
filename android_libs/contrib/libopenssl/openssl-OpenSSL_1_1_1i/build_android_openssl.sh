# OpenSSL_1_1_1i
# 使用环境变量中的ANDROID_NDK_HOME
export ANDROID_NDK_HOME=/Users/yuhaoo/Library/Android/sdk/ndk/21.1.6352462
HOST_TAG=darwin-x86_64
API=26
ABI=
ARCH=
TARGET=
# 设置编译的目标库
# 目标库的选项 android-arm, android-arm64, android-x86,  android-x86_64 etc
OPENSSL_PLATFORM_CFG_FLAGS=

fun_build_clean() {
  echo "build target clean"
  make clean
}

fun_build_config_armv7a() {
  echo "build target armv7a config"
  OPENSSL_PLATFORM_CFG_FLAGS="android-arm"
  # Application Binary Interface (ABI)
  ABI=armeabi-v7a
  ARCH=arm
  TARGET=armv7a-linux-androideabi
}

fun_build_config_arm64() {
  echo "build target arm64 config"
  OPENSSL_PLATFORM_CFG_FLAGS="android-arm64"
  # Application Binary Interface (ABI)
  ABI=arm64-v8a
  ARCH=arm64
  TARGET=aarch64-linux-android
}

fun_build_config_x86() {
  echo "build target x86 config"
  OPENSSL_PLATFORM_CFG_FLAGS="android-x86"
  # Application Binary Interface (ABI)
  ABI=x86
  ARCH=x86
  TARGET=i686-linux-android
}

fun_build_config_x86_64() {
  echo "build target x86_64 config"
  OPENSSL_PLATFORM_CFG_FLAGS="android-x86_64"
  # Application Binary Interface (ABI)
  ABI=x86_64
  ARCH=x86_64
  TARGET=x86_64-linux-android

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

PREBUILT=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt
YTXPLAYER_PATH=$(git rev-parse --show-toplevel)
PREFIX=$YTXPLAYER_PATH/build/output/jniLibs/$ABI
# SYSROOT=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/$HOST_TAG/sysroot

PATH=${ANDROID_NDK_HOME}/toolchains/llvm/prebuilt/$HOST_TAG/bin:$ANDROID_NDK_HOME/toolchains/arm-linux-androideabi-4.9/prebuilt/$HOST_TAG/bin:$PATH


# export CROSS_COMPILE=$PREBUILT/${HOST_TAG}/bin/$TARGET$API
export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig
export PKG_CONFIG_LIBDIR=${PREFIX}/lib/pkgconfig

echo "$PREFIX"

OPENSSL_PREFIX=$PREFIX

#--------------------
# Standard options:
OPENSSL_CFG_FLAGS="$OPENSSL_CFG_FLAGS zlib"
OPENSSL_CFG_FLAGS="$OPENSSL_CFG_FLAGS no-shared"
OPENSSL_CFG_FLAGS="$OPENSSL_CFG_FLAGS no-asm"
OPENSSL_CFG_FLAGS="$OPENSSL_CFG_FLAGS --prefix=$OPENSSL_PREFIX"
OPENSSL_CFG_FLAGS="$OPENSSL_CFG_FLAGS $OPENSSL_PLATFORM_CFG_FLAGS"
OPENSSL_CFG_FLAGS="$OPENSSL_CFG_FLAGS -D__ANDROID_API__=$API"

#--------------------

echo "./Configure $OPENSSL_CFG_FLAGS"
#./Configure $OPENSSL_CFG_FLAGS
if ! (./Configure $OPENSSL_CFG_FLAGS); then
  echo "config openssl error!"
  exit 1
fi

make || exit 1
make install || exit 1
