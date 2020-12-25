#ffmpeg-4.3.1
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

SYSROOT=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/$HOST_TAG/sysroot

# OPTIMIZE_CFLAGS=
#HOST_TAG 的值根据系统修改
#macOS  darwin-x86_64
#Linux   linux-x86_64
#32-bit Windows  windows
#64-bit Windows  windows-x86_64


# arm64-v8a   aarch64-linux-android

# ARCH=arm64
# CPU=armv8-a
# TARGET=aarch64-linux-android
# STRIP=aarch64-linux-android
OPTIMIZE_CFLAGS="-march=$CPU"


# armeabi-v7a armv7a-linux-androideabi

# STRIP=arm-linux-androideabi
# OPTIMIZE_CFLAGS="-mfloat-abi=softfp -mfpu=vfp -marm -march=$CPU "

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


export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig
export PKG_CONFIG_LIBDIR=${PREFIX}/lib/pkgconfig

export CXX="${CROSS_COMPILE}clang++"
export CC="${CROSS_COMPILE}clang"
# NM="${PREBUILT}/${HOST_TAG}/bin/arm-linux-androideabi-nm"
export STRIP="$PREBUILT/$HOST_TAG/bin/${TARGET}-strip"
export RANLIB="$PREBUILT/$HOST_TAG/bin/${TARGET}-ranlib"
# AR="$PREBUILT/${HOST_TAG}/bin/arm-linux-androideabi-ar"
# 注意这里不能使用arm-linux-androideabi-ld否则config过程会包连接错误,
# 只能通过armv7a-linux-androideabi-clang来连接
export LD="${CROSS_COMPILE}clang"
# export LD="$PREBUILT/$HOST_TAG/bin/${TARGET}-ld"

FF_CFG_FLAGS=
FF_EXTRA_LDFLAGS=

FF_DEP_OPENSSL_INC=$PREFIX/include
FF_DEP_OPENSSL_LIB=$PREFIX/lib

FF_DEP_RTMP_INC=$PREFIX/include
FF_DEP_RTMP_LIB=$PREFIX/lib

# FF_CFG_FLAGS="$FF_CFG_FLAGS --enable-neon"
# FF_CFG_FLAGS="$FF_CFG_FLAGS --enable-thumb"
FF_CFG_FLAGS="$FF_CFG_FLAGS --enable-openssl"
FF_CFG_FLAGS="$FF_CFG_FLAGS --enable-libfreetype"
FF_CFG_FLAGS="$FF_CFG_FLAGS --enable-libfribidi"
FF_CFG_FLAGS="$FF_CFG_FLAGS --enable-libx264"
FF_CFG_FLAGS="$FF_CFG_FLAGS --enable-libfdk-aac"
FF_CFG_FLAGS="$FF_CFG_FLAGS --enable-libxml2"
FF_CFG_FLAGS="$FF_CFG_FLAGS --enable-libfontconfig"
FF_CFG_FLAGS="$FF_CFG_FLAGS --enable-libmp3lame"
FF_CFG_FLAGS="$FF_CFG_FLAGS --enable-iconv"
FF_CFG_FLAGS="$FF_CFG_FLAGS --enable-libass"
FF_CFG_FLAGS="$FF_CFG_FLAGS --enable-librtmp"


FF_CFG_FLAGS="$FF_CFG_FLAGS --enable-gpl"

FF_CFG_FLAGS="$FF_CFG_FLAGS --enable-nonfree"
FF_CFG_FLAGS="$FF_CFG_FLAGS --disable-postproc"
FF_CFG_FLAGS="$FF_CFG_FLAGS --disable-avdevice"
FF_CFG_FLAGS="$FF_CFG_FLAGS --enable-protocol=rtp"
FF_CFG_FLAGS="$FF_CFG_FLAGS --enable-demuxer=rtsp"
FF_CFG_FLAGS="$FF_CFG_FLAGS --enable-protocol=tcp"


FF_CFLAGS="$PREFIX/include"
FF_DEP_LIBS=

# 必须添加-lm和-lz的依赖
FF_DEP_LIBS="-lm -lz -L$PREFIX/lib -lmp3lame -lxml2 -lpng16 -lharfbuzz -lfreetype -liconv -lfribidi -lfontconfig"

# FF_CFLAGS="-O3 -DANDROID"
# FF_CFLAGS="$FF_CFLAGS -I${FF_DEP_OPENSSL_INC} -I${FF_DEP_RTMP_INC}"
# FF_DEP_LIBS="-L${FF_DEP_OPENSSL_LIB} -L${FF_DEP_RTMP_LIB} -lssl -lcrypto"
# FF_DEP_LIBS="-L${FF_DEP_OPENSSL_LIB} -L${FF_DEP_RTMP_LIB} -lssl -lcrypto -lrtmp"
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
# FF_CFG_FLAGS="$FF_CFG_FLAGS --enable-asm"
# FF_CFG_FLAGS="$FF_CFG_FLAGS --enable-inline-asm"

echo $FF_DEP_LIBS
echo $FF_EXTRA_LDFLAGS
echo $SYSROOT

# pkg-config libssl --libs
./configure $FF_CFG_FLAGS --prefix=$PREFIX \
--cc=$CC \
--cxx=$CXX \
--arch=$ARCH \
--cpu=$CPU \
--sysroot=$SYSROOT \
--pkg-config=pkg-config \
--extra-cflags="-fpic $OPTIMIZE_CFLAGS $FF_CFLAGS" \
--extra-ldflags="$FF_DEP_LIBS $FF_EXTRA_LDFLAGS" \
--enable-static \
--enable-shared \
--strip=$STRIP \
--ranlib=$RANLIB \
--ld=$LD \

# --enable-shared \
# --nm=$NM \
# --ar=$AR \

make
make install
