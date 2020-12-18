#ffmpeg-4.3.1
export ANDROID_NDK_HOME=/home/vagrant/Android/android-ndk-r21d
HOST_TAG=linux-x86_64

#HOST_TAG 的值根据系统修改
#macOS  darwin-x86_64
#Linux   linux-x86_64
#32-bit Windows  windows
#64-bit Windows  windows-x86_64
API=26

# arm64-v8a   aarch64-linux-android

# ARCH=arm64
# CPU=armv8-a
# TARGET=aarch64-linux-android
# STRIP=aarch64-linux-android
# OPTIMIZE_CFLAGS="-march=$CPU"


# armeabi-v7a armv7a-linux-androideabi

ARCH=arm
CPU=armv7-a
TARGET=armv7a-linux-androideabi
# STRIP=arm-linux-androideabi
OPTIMIZE_CFLAGS="-mfloat-abi=softfp -mfpu=vfp -marm -march=$CPU "

# export AR=$TOOLCHAIN/bin/$TARGET-ar
# export AS=$TOOLCHAIN/bin/$TARGET-as
# export CC=$TOOLCHAIN/bin/$TARGET$API-clang
# export CXX=$TOOLCHAIN/bin/$TARGET$API-clang++
# export LD=$TOOLCHAIN/bin/$TARGET-ld
# export RANLIB=$TOOLCHAIN/bin/$TARGET-ranlib
# export STRIP=$TOOLCHAIN/bin/$TARGET-strip

# # x86 i686-linux-android

# ARCH=x86
# CPU=x86
# TARGET=i686-linux-android
# STRIP=i686-linux-android
# OPTIMIZE_CFLAGS="-march=i686 -mtune=intel -mssse3 -mfpmath=sse -m32"

# x86-64  x86_64-linux-android

# ARCH=x86_64
# CPU=x86-64
# TARGET=x86_64-linux-android
# STRIP=x86_64-linux-android
# OPTIMIZE_CFLAGS="-march=$CPU -msse4.2 -mpopcnt -m64 -mtune=intel"

SYSROOT=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/$HOST_TAG/sysroot
PREFIX=$YTXPLAYER_PATH/android/contrib/jni/jniLibs


PREBUILT=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt
PREFIX=$YTXPLAYER_PATH/android/contrib/jni/jniLibs

CROSS_COMPILE=$PREBUILT/${HOST_TAG}/bin/$TARGET$API



export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig

CXX="${CROSS_COMPILE}-clang++"
CC="${CROSS_COMPILE}-clang"
NM="${PREBUILT}/${HOST_TAG}/bin/arm-linux-androideabi-nm"
STRIP="$PREBUILT/${HOST_TAG}/bin/arm-linux-androideabi-strip"
RANLIB="$PREBUILT/${HOST_TAG}/bin/arm-linux-androideabi-ranlib"
AR="$PREBUILT/${HOST_TAG}/bin/arm-linux-androideabi-ar"
LD="$PREBUILT/${HOST_TAG}/bin/arm-linux-androideabi-ld"

FF_CFG_FLAGS=
FF_EXTRA_LDFLAGS=

FF_DEP_OPENSSL_INC=$PREFIX/include
FF_DEP_OPENSSL_LIB=$PREFIX/lib

FF_DEP_RTMP_INC=$PREFIX/include
FF_DEP_RTMP_LIB=$PREFIX/lib

FF_CFG_FLAGS="$FF_CFG_FLAGS --enable-neon"
FF_CFG_FLAGS="$FF_CFG_FLAGS --enable-thumb"
# FF_CFG_FLAGS="$FF_CFG_FLAGS --enable-openssl"
FF_CFG_FLAGS="$FF_CFG_FLAGS --enable-libass"
FF_CFG_FLAGS="$FF_CFG_FLAGS --enable-libfreetype"
FF_CFG_FLAGS="$FF_CFG_FLAGS --enable-libfribidi"
FF_CFG_FLAGS="$FF_CFG_FLAGS --enable-libx264"
FF_CFG_FLAGS="$FF_CFG_FLAGS --enable-gpl"
# FF_CFG_FLAGS="$FF_CFG_FLAGS --enable-libfaac"
# FF_CFG_FLAGS="$FF_CFG_FLAGS --enable-nonfree"
FF_CFG_FLAGS="$FF_CFG_FLAGS --disable-postproc"
FF_CFG_FLAGS="$FF_CFG_FLAGS --disable-avdevice"
FF_CFG_FLAGS="$FF_CFG_FLAGS --enable-protocol=rtp"
FF_CFG_FLAGS="$FF_CFG_FLAGS --enable-demuxer=rtsp"
FF_CFG_FLAGS="$FF_CFG_FLAGS --enable-protocol=tcp"
# FF_CFG_FLAGS="$FF_CFG_FLAGS --enable-librtmp"


FF_CFLAGS="-O3 -DANDROID"
FF_CFLAGS="$FF_CFLAGS -I${FF_DEP_OPENSSL_INC} -I${FF_DEP_RTMP_INC}"
FF_DEP_LIBS="-L${FF_DEP_OPENSSL_LIB} -L${FF_DEP_RTMP_LIB} -lssl -lcrypto -lrtmp"
#--------------------
# Standard options:
#FF_CFG_FLAGS="$FF_CFG_FLAGS --prefix=$FF_PREFIX"

# Advanced options (experts only):
# FF_CFG_FLAGS="$FF_CFG_FLAGS --cross-prefix=${FF_CROSS_PREFIX}-"
FF_CFG_FLAGS="$FF_CFG_FLAGS --enable-cross-compile"
FF_CFG_FLAGS="$FF_CFG_FLAGS --target-os=android"
# FF_CFG_FLAGS="$FF_CFG_FLAGS --target-os=linux"
FF_CFG_FLAGS="$FF_CFG_FLAGS --enable-pic"
# FF_CFG_FLAGS="$FF_CFG_FLAGS --disable-symver"

# Optimization options (experts only):
FF_CFG_FLAGS="$FF_CFG_FLAGS --enable-asm"
FF_CFG_FLAGS="$FF_CFG_FLAGS --enable-inline-asm"

echo $FF_DEP_LIBS
echo $FF_EXTRA_LDFLAGS
echo $SYSROOT
./configure $FF_CFG_FLAGS --prefix=$PREFIX \
--extra-cflags="-fpic $OPTIMIZE_CFLAGS" \
--extra-ldflags="$FF_DEP_LIBS $FF_EXTRA_LDFLAGS" \
--cc=$CC \
--cxx=$CXX \
--strip=$STRIP \
--nm=$NM \
--ar=$AR \
--ranlib=$RANLIB \
--ld=$LD \
--arch=$ARCH \
--cpu=$CPU \
--sysroot=$SYSROOT \
--pkg-config=pkg-config \
--enable-shared \
--enable-static

# make
# make install
