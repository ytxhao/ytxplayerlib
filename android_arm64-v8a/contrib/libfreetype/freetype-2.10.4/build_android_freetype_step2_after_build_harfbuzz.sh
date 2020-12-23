#freetype-2.10.4
#http://www.linuxfromscratch.org/blfs/view/svn/general/freetype2.html
# Recommended
# HarfBuzz-2.7.2 (first, install without it, after it is installed, reinstall FreeType-2.10.4), libpng-1.6.37, and Which-2.21
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

PLATFORM=$ANDROID_NDK_HOME/platforms/android-$API/arch-$ARCH
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


CROSS_COMPILE=$PREBUILT/$HOST_TAG/bin/${TARGET}${API}-

# export CXX="${CROSS_COMPILE}clang++ --sysroot=${TOOLCHAIN}/sysroot"
# export CC="${CROSS_COMPILE}clang --sysroot=${TOOLCHAIN}/sysroot"
export CXX="${CROSS_COMPILE}clang++"
export CC="${CROSS_COMPILE}clang"

export NM="${PREBUILT}/$HOST_TAG/bin/${TARGET}-nm"
export STRIP="$PREBUILT/$HOST_TAG/bin/${TARGET}-strip"
export RANLIB="$PREBUILT/$HOST_TAG/bin/${TARGET}-ranlib"
export AR="$PREBUILT/$HOST_TAG/bin/${TARGET}-ar"
export LD="$PREBUILT/$HOST_TAG/bin/${TARGET}-ld"

export LIBPNG_CFLAGS="-I${PREFIX}/include"
export LIBPNG_LIBS="-L${PREFIX}/lib -lpng16"
# echo "start"
# libpng-config --cflags
# libpng-config --ldflags
# libpng-config --static --ldflags

./configure --prefix=$PREFIX \
--host=arm-linux-androideabi \
--with-harfbuzz=yes \
--enable-shared=yes \
--with-sysroot=${PLATFORM}
#--with-png=no 
# --with-harfbuzz=yes \

make
make install
