#faad2-2.8.8
export ANDROID_NDK_HOME=/Users/yuhao/Library/Android/android-ndk-r21b
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
CROSS_COMPILE=$PREBUILT/$HOST_TAG/bin/armv7a-linux-androideabi26-


export CFLAGS="-fpic -lm -landroid_support"


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

LDFLAGS=-L${PREFIX}/lib

export CPPFLAGS="$CFLAGS"
export CXXFLAGS="$CFLAGS"
export CXX="${CROSS_COMPILE}clang++"
# export LDFLAGS="$LDFLAGS -L${PREBUILT}/darwin-x86_64/sysroot/usr/lib/arm-linux-androideabi/26/"
export LDFLAGS="$LDFLAGS"
echo $LDFLAGS
# export CC="${CROSS_COMPILE}clang --sysroot=${PLATFORM}"
export CC="${CROSS_COMPILE}clang"
export NM="$PREBUILT/$HOST_TAG/bin/arm-linux-androideabi-nm"
export STRIP="$$PREBUILT/$HOST_TAG/bin/arm-linux-androideabi-strip"
export RANLIB="$PREBUILT/$HOST_TAG/bin/arm-linux-androideabi-ranlib"
export AR="$PREBUILT/$HOST_TAG/bin/arm-linux-androideabi-ar"
export LD="$PREBUILT/$HOST_TAG/bin/arm-linux-androideabi-ld"

./configure --prefix=$PREFIX \
--host=arm-linux-androideabi \
--with-sysroot=${SYSROOT}

make
make install
