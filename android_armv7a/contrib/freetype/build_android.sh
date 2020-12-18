#freetype-2.10.4
#http://www.linuxfromscratch.org/blfs/view/svn/general/freetype2.html
# Recommended
# HarfBuzz-2.7.2 (first, install without it, after it is installed, reinstall FreeType-2.10.4), libpng-1.6.37, and Which-2.21
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
CFLAGS="-fpic"


LDFLAGS=-L${PREFIX}/lib
export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig
export PKG_CONFIG_LIBDIR=${PREFIX}/lib/pkgconfig
export CPPFLAGS="$CFLAGS"
export CXXFLAGS="$CFLAGS"
export LDFLAGS="$LDFLAGS"


CROSS_COMPILE=$PREBUILT/$HOST_TAG/bin/armv7a-linux-androideabi26-

# export CXX="${CROSS_COMPILE}clang++ --sysroot=${TOOLCHAIN}/sysroot"
# export CC="${CROSS_COMPILE}clang --sysroot=${TOOLCHAIN}/sysroot"
export CXX="${CROSS_COMPILE}clang++"
export CC="${CROSS_COMPILE}clang"
export NM="${PREBUILT}/$HOST_TAG/bin/arm-linux-androideabi-nm"
export STRIP="$PREBUILT/$HOST_TAG/bin/arm-linux-androideabi-strip"
export RANLIB="$PREBUILT/$HOST_TAG/bin/arm-linux-androideabi-ranlib"
export AR="$PREBUILT/$HOST_TAG/bin/arm-linux-androideabi-ar"
export LD="$PREBUILT/$HOST_TAG/bin/arm-linux-androideabi-ld"

./configure --prefix=$PREFIX \
--host=arm-linux \
--enable-shared=no \
--with-harfbuzz=no \
--with-sysroot=${PLATFORM}
#--with-png=no 

make
make install
