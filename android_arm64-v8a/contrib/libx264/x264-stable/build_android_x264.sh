#libx264
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

PLATFORM=$ANDROID_NDK_HOME/platforms/android-$API/arch-$ARCH/
TOOLCHAIN=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/$HOST_TAG

CFLAGS="-fPIC"
 
export PATH=$PREBUILT/$HOST_TAG/bin/:${PATH}
echo $PATH

CROSS_COMPILE=$PREBUILT/$HOST_TAG/bin/${TARGET}${API}-

export CXX="${CROSS_COMPILE}clang++"
export CC="${CROSS_COMPILE}clang"

export NM="${PREBUILT}/$HOST_TAG/bin/${TARGET}-nm"
export STRIP="$PREBUILT/$HOST_TAG/bin/${TARGET}-strip"
export RANLIB="$PREBUILT/$HOST_TAG/bin/${TARGET}-ranlib"
export AR="$PREBUILT/$HOST_TAG/bin/${TARGET}-ar"
export LD="$PREBUILT/$HOST_TAG/bin/${TARGET}-ld"
echo $STRIP
# ./configure --prefix=$PREFIX \
# --cross-prefix=arm-linux-androideabi- \
# --sysroot=${PLATFORM} \
# --extra-cflags=$CFLAGS \
# --host=arm-linux \
# --enable-shared \
# --enable-static

./configure --prefix=$PREFIX \
--sysroot=${TOOLCHAIN}/sysroot \
--extra-cflags=$CFLAGS \
--host=arm-linux \
--disable-asm \
--enable-shared \
--enable-static

make
make install

# cp libx264.so ${PREFIX}/lib
# cp libx264.a ${PREFIX}/lib

