#libx264
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

PLATFORM=$ANDROID_NDK_HOME/platforms/android-26/arch-arm/
TOOLCHAIN=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/$HOST_TAG

CFLAGS="-fPIC -DANDROID -ffunction-sections -msoft-float"
 
export PATH=$PREBUILT/$HOST_TAG/bin/:${PATH}
echo $PATH

CROSS_COMPILE=$PREBUILT/$HOST_TAG/bin/armv7a-linux-androideabi26-

export CXX="${CROSS_COMPILE}clang++"
export CC="${CROSS_COMPILE}clang"
export NM="${PREBUILT}/$HOST_TAG/bin/arm-linux-androideabi-nm"
export STRIP="$PREBUILT/$HOST_TAG/bin/arm-linux-androideabi-strip"
export RANLIB="$PREBUILT/$HOST_TAG/bin/arm-linux-androideabi-ranlib"
export AR="$PREBUILT/$HOST_TAG/bin/arm-linux-androideabi-ar"
export LD="$PREBUILT/$HOST_TAG/bin/arm-linux-androideabi-ld"
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
--enable-shared \
--enable-static

make
make install

# cp libx264.so ${PREFIX}/lib
# cp libx264.a ${PREFIX}/lib

