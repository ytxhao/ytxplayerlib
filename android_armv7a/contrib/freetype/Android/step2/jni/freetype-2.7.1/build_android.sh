NDK=/home/yuhao/android/ndk/android-ndk-r11b
PLATFORM=$NDK/platforms/android-19/arch-arm
PREBUILT=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt
PREFIX=$YTXPLAYER_PATH/android/contrib/jni/jniLibs

echo $PREFIX
echo ${PLATFORM}    
CFLAGS="-fpic -DANDROID -ffunction-sections -msoft-float -lm"

CROSS_COMPILE=$PREBUILT/linux-x86_64/bin/arm-linux-androideabi-
LDFLAGS=-L${PREFIX}/lib
export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig
export CPPFLAGS="$CFLAGS"
export CXXFLAGS="$CFLAGS"
export CXX="${CROSS_COMPILE}g++ --sysroot=${PLATFORM}"
export LDFLAGS="$LDFLAGS"
export CC="${CROSS_COMPILE}gcc --sysroot=${PLATFORM}"
export NM="${CROSS_COMPILE}nm"
export STRIP="${CROSS_COMPILE}strip"
export RANLIB="${CROSS_COMPILE}ranlib"
export AR="${CROSS_COMPILE}ar"

./configure --prefix=$PREFIX \
--host=arm-linux \
#--with-harfbuzz=no 

make
#make install
