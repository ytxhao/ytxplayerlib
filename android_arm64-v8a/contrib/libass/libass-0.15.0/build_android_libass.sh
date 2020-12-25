#libass-0.15.0
#export ANDROID_NDK_HOME=/home/vagrant/Android/android-ndk-r21d
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

CROSS_COMPILE=$PREBUILT/$HOST_TAG/bin/${TARGET}${API}-

echo $PREFIX
echo ${PLATFORM}
#CFLAGS="-fpic -DANDROID -ffunction-sections -msoft-float -lm"
CFLAGS="-fpic -I${PREFIX}/include"

LDFLAGS=-L${PREFIX}/lib
export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig
export PKG_CONFIG_LIBDIR=${PREFIX}/lib/pkgconfig
export CPPFLAGS="$CFLAGS"
export CXXFLAGS="$CFLAGS"
export CFLAGS="$CFLAGS"
export LDFLAGS="$LDFLAGS"

# export CXX="${CROSS_COMPILE}clang++ --sysroot=${TOOLCHAIN}/sysroot"
# export CC="${CROSS_COMPILE}clang --sysroot=${TOOLCHAIN}/sysroot"
# export NM="${PREBUILT}/$HOST_TAG/bin/arm-linux-androideabi-nm"
# export STRIP="$PREBUILT/$HOST_TAG/bin/arm-linux-androideabi-strip"
# export RANLIB="$PREBUILT/$HOST_TAG/bin/arm-linux-androideabi-ranlib"
# export AR="$PREBUILT/$HOST_TAG/bin/arm-linux-androideabi-ar"
# export LD="$PREBUILT/$HOST_TAG/bin/arm-linux-androideabi-ld"

export CXX="${CROSS_COMPILE}clang++"
export CC="${CROSS_COMPILE}clang"

export NM="${PREBUILT}/$HOST_TAG/bin/${TARGET}-nm"
export STRIP="$PREBUILT/$HOST_TAG/bin/${TARGET}-strip"
export RANLIB="$PREBUILT/$HOST_TAG/bin/${TARGET}-ranlib"
export AR="$PREBUILT/$HOST_TAG/bin/${TARGET}-ar"
export LD="$PREBUILT/$HOST_TAG/bin/${TARGET}-ld"

./configure --prefix=$PREFIX \
--host=arm-linux-androideabi \
--with-sysroot=${PLATFORM} \
--enable-shared=yes \
--enable-static=yes
#--disable-harfbuzz

make
make install
