NDK=/home/yuhao/android/ndk/android-ndk-r11b
PLATFORM=$NDK/platforms/android-19/arch-arm
PREBUILT=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt
PREFIX=$YTXPLAYER_PATH/android/contrib/jni/jniLibs

echo $PREFIX
     
CFLAGS="-fpic -DANDROID -ffunction-sections -msoft-float -lm"

CROSS_COMPILE=$PREBUILT/linux-x86_64/bin/arm-linux-androideabi-
LDFLAGS=-L${PREFIX}/lib
export CFLAGS="$CFLAGS"
export CXX="${CROSS_COMPILE}g++"
export LDFLAGS="$LDFLAGS"
export CC="${CROSS_COMPILE}gcc --sysroot=${PLATFORM}"
export NM="${CROSS_COMPILE}nm"
export STRIP="${CROSS_COMPILE}strip"
export RANLIB="${CROSS_COMPILE}ranlib"
export AR="${CROSS_COMPILE}ar"

./configure --prefix=$PREFIX \
--host=arm-linux \

# use Android.mk build
make
make install
