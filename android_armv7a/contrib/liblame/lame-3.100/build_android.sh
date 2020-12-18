#lame-3.100
export ANDROID_NDK_HOME=/home/vagrant/Android/android-ndk-r21d
HOST_TAG=linux-x86_64
HOST_TAG=linux-x86_64
API=26
# Application Binary Interface (ABI)
ABI=armeabi-v7a
ARCH=arm
CPU=armv7-a
TARGET=armv7a-linux-androideabi
PREBUILT=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt
PREFIX=$YTXPLAYER_PATH/android/contrib/jni/jniLibs/$ABI

PLATFORM=$ANDROID_NDK_HOME/platforms/android-26/arch-arm/
TOOLCHAIN=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/$HOST_TAG

echo $PREFIX
echo ${PLATFORM}    
#CFLAGS="-fpic -DANDROID -ffunction-sections -msoft-float -lm"
CFLAGS="-fpic -I${PREFIX}/include"

CROSS_COMPILE=$PREBUILT/$HOST_TAG/bin/armv7a-linux-androideabi26-
LDFLAGS=-L${PREFIX}/lib
export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig
export PKG_CONFIG_LIBDIR=${PREFIX}/lib/pkgconfig
export CPPFLAGS="$CFLAGS"
export CXXFLAGS="$CFLAGS"
export CFLAGS="$CFLAGS"
export LDFLAGS="$LDFLAGS"

export CXX="${CROSS_COMPILE}clang++ --sysroot=${TOOLCHAIN}/sysroot"
export CC="${CROSS_COMPILE}clang --sysroot=${TOOLCHAIN}/sysroot"
export NM="${PREBUILT}/$HOST_TAG/bin/arm-linux-androideabi-nm"
export STRIP="$PREBUILT/$HOST_TAG/bin/arm-linux-androideabi-strip"
export RANLIB="$PREBUILT/$HOST_TAG/bin/arm-linux-androideabi-ranlib"
export AR="$PREBUILT/$HOST_TAG/bin/arm-linux-androideabi-ar"
export LD="$PREBUILT/$HOST_TAG/bin/arm-linux-androideabi-ld"

./configure --prefix=$PREFIX \
--host=arm-linux \
--enable-shared=no
#--disable-harfbuzz

make
make install
