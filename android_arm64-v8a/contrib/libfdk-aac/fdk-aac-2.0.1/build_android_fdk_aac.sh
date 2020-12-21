#fdk-aac v2.0.1 
export ANDROID_NDK_HOME=/home/vagrant/Android/android-ndk-r21d
YTXPLAYER_PATH=$(git rev-parse --show-toplevel)
HOST_TAG=linux-x86_64
API=26
# Application Binary Interface (ABI)
ABI=arm64-v8a
ARCH=arm64
CPU=armv8-a
TARGET=aarch64-linux-android

PREBUILT=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt
PREFIX=$YTXPLAYER_PATH/build/output/jniLibs/$ABI
TOOLCHAIN=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/$HOST_TAG
SYSROOT=$ANDROID_NDK_HOME/platforms/android-$API/arch-$ARCH/
echo $PREFIX
     
CFLAGS="-fpic"
# SYSROOT=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/$HOST_TAG/sysroot
# CROSS_COMPILE=$PREBUILT/$HOST_TAG/bin/armv7a-linux-androideabi26-
CROSS_COMPILE=$PREBUILT/$HOST_TAG/bin/${TARGET}${API}-
LDFLAGS=-L${PREFIX}/lib

export CPPFLAGS="$CFLAGS"
export CXXFLAGS="$CFLAGS"
export LDFLAGS="$LDFLAGS"

export CXX="${CROSS_COMPILE}clang++"
export CC="${CROSS_COMPILE}clang"


export NM="${PREBUILT}/$HOST_TAG/bin/${TARGET}-nm"
export STRIP="$PREBUILT/$HOST_TAG/bin/${TARGET}-strip"
export RANLIB="$PREBUILT/$HOST_TAG/bin/${TARGET}-ranlib"
export AR="$PREBUILT/$HOST_TAG/bin/${TARGET}-ar"

./configure --prefix=$PREFIX \
--enable-static \
--with-sysroot=$SYSROOT \
--disable-asm \
--enable-pic \
--target=android \
--host=arm-linux-androideabi 


make
make install
