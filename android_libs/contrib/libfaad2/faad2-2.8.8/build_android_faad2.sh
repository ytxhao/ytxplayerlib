#faad2-2.8.8
#使用环境变量中的ANDROID_NDK_HOME
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
TOOLCHAIN=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/$HOST_TAG
SYSROOT=$ANDROID_NDK_HOME/platforms/android-$API/arch-$ARCH/
# SYSROOT=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/$HOST_TAG
CROSS_COMPILE=$PREBUILT/$HOST_TAG/bin/${TARGET}${API}-


export CFLAGS="-fpic -lm"
# export CFLAGS="-fpic"


# export CPPFLAGS="$CFLAGS"
# export CFLAGS="$CFLAGS"
# export CXXFLAGS="$CFLAGS"
# export CXX="${CROSS_COMPILE}g++ --sysroot=${PLATFORM}"
# export LDFLAGS="$LDFLAGS"
# export CC="${CROSS_COMPILE}gcc --sysroot=${PLATFORM}"
# export NM="${CROSS_COMPILE}nm"
# export STRIP="${CROSS_COMPILE}strip"
# export RANLIB="${CROSS_COMPILE}ranlib"
# export AR="${CROSS_COMPILE}ar"

LDFLAGS="-L${PREFIX}/lib"

export CPPFLAGS="$CFLAGS"
export CXXFLAGS="$CFLAGS"

# export LDFLAGS="$LDFLAGS -L${PREBUILT}/darwin-x86_64/sysroot/usr/lib/arm-linux-androideabi/26/"
export LDFLAGS="$LDFLAGS"
echo $LDFLAGS
# export CC="${CROSS_COMPILE}clang --sysroot=${PLATFORM}"
export CC="${CROSS_COMPILE}clang"
export CXX="${CROSS_COMPILE}clang++"

export NM="${PREBUILT}/$HOST_TAG/bin/${TARGET}-nm"
export STRIP="$PREBUILT/$HOST_TAG/bin/${TARGET}-strip"
export RANLIB="$PREBUILT/$HOST_TAG/bin/${TARGET}-ranlib"
export AR="$PREBUILT/$HOST_TAG/bin/${TARGET}-ar"
export LD="$PREBUILT/$HOST_TAG/bin/${TARGET}-ld"
# export LD="${CROSS_COMPILE}clang"

./configure --prefix=$PREFIX \
--host=arm-linux-androideabi \
--with-sysroot=${SYSROOT}

make
make install
