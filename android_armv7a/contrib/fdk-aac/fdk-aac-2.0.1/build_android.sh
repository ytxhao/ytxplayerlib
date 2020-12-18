#fdk-aac v2.0.1 
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
TOOLCHAIN=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/$HOST_TAG
SYSROOT=$ANDROID_NDK_HOME/platforms/android-$API/arch-$ARCH/
echo $PREFIX
     
CFLAGS="-fpic"
# SYSROOT=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/$HOST_TAG/sysroot
CROSS_COMPILE=$PREBUILT/$HOST_TAG/bin/armv7a-linux-androideabi26-
LDFLAGS=-L${PREFIX}/lib

export CPPFLAGS="$CFLAGS"
export CXXFLAGS="$CFLAGS"
export LDFLAGS="$LDFLAGS"

export CXX="${CROSS_COMPILE}clang++"
export CC="${CROSS_COMPILE}clang"


export NM="${PREBUILT}/$HOST_TAG/bin/arm-linux-androideabi-nm"
export STRIP="$PREBUILT/$HOST_TAG/bin/arm-linux-androideabi-strip"
export RANLIB="$PREBUILT/$HOST_TAG/bin/arm-linux-androideabi-ranlib"
export AR="$PREBUILT/$HOST_TAG/bin/arm-linux-androideabi-ar"

./configure --prefix=$PREFIX \
--enable-static \
--with-sysroot=$SYSROOT \
--disable-asm \
--enable-pic \
--target=android \
--host=arm-linux-androideabi 


make
make install
