# OpenSSL_1_1_1i
export ANDROID_NDK_HOME=/home/vagrant/Android/android-ndk-r21d
HOST_TAG=linux-x86_64
API=26
# Application Binary Interface (ABI)
ABI=armeabi-v7a
ARCH=arm
CPU=armv7-a
TARGET=armv7a-linux-androideabi
PREBUILT=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt
PREFIX=$YTXPLAYER_PATH/android/contrib/jni/jniLibs/$ABI

# SYSROOT=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/$HOST_TAG/sysroot

PATH=${ANDROID_NDK_HOME}/toolchains/llvm/prebuilt/$HOST_TAG/bin:$ANDROID_NDK_HOME/toolchains/arm-linux-androideabi-4.9/prebuilt/$HOST_TAG/bin:$PATH


# export CROSS_COMPILE=$PREBUILT/${HOST_TAG}/bin/$TARGET$API
export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig
export PKG_CONFIG_LIBDIR=${PREFIX}/lib/pkgconfig


echo $PREFIX


OPENSSL_PREFIX=$PREFIX
# 设置编译的目标库
# 目标库的选项 android-arm, android-arm64, android-x86, android-x86 etc
OPENSSL_PLATFORM_CFG_FLAGS="android-arm"

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
./Configure $OPENSSL_CFG_FLAGS

make
make install
