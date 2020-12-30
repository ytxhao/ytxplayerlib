#ffmpeg-4.3.1
#export ANDROID_NDK_HOME=/home/vagrant/Android/android-ndk-r21d
YTXPLAYER_PATH=$(git rev-parse --show-toplevel)
HOST_TAG=linux-x86_64

API=26
# Application Binary Interface (ABI)
ABI=
ARCH=
TARGET=
TARGET_TOOL=
HOST=

fun_build_clean() {
  echo "build target clean"
  make clean
  make distclean
}

fun_build_config_armv7a() {
  echo "build target armv7a config"
  # Application Binary Interface (ABI)
  ABI=armeabi-v7a
  ARCH=arm
  TARGET=armv7a-linux-androideabi
  TARGET_TOOL=arm-linux-androideabi
  HOST=arm-linux-android
}

fun_build_config_arm64() {
  echo "build target arm64 config"
  # Application Binary Interface (ABI)
  ABI=arm64-v8a
  ARCH=arm64
  TARGET=aarch64-linux-android
  TARGET_TOOL=aarch64-linux-android
  HOST=arm-linux-android
}

fun_build_config_x86() {
  echo "build target x86 config"
  # Application Binary Interface (ABI)
  ABI=x86
  ARCH=x86
  TARGET=i686-linux-android
  TARGET_TOOL=i686-linux-android
  HOST=x86-linux-android
}

fun_build_config_x86_64() {
  echo "build target x86_64 config"
  # Application Binary Interface (ABI)
  ABI=x86_64
  ARCH=x86_64
  TARGET=x86_64-linux-android
  TARGET_TOOL=x86_64-linux-android
  HOST=x86-linux-android
}

if [ "$1" = "clean" ]; then
  fun_build_clean
  exit 0
fi

if [ "$1" = "-armv7a" ] || [ "$2" = "-armv7a" ]; then
  fun_build_config_armv7a
fi

if [ "$1" = "-arm64" ] || [ "$2" = "-arm64" ]; then
  fun_build_config_arm64
fi

if [ "$1" = "-x86" ] || [ "$2" = "-x86" ]; then
  fun_build_config_x86
fi

if [ "$1" = "-x86_64" ] || [ "$2" = "-x86_64" ]; then
  fun_build_config_x86_64
fi


PREBUILT=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt
PREFIX=$YTXPLAYER_PATH/build/output/jniLibs/$ABI
PLATFORM=$ANDROID_NDK_HOME/platforms/android-$API/arch-$ARCH
TOOLCHAIN=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/$HOST_TAG
CROSS_COMPILE=$PREBUILT/$HOST_TAG/bin/${TARGET}${API}-

SYSROOT=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/$HOST_TAG/sysroot

#OPTIMIZE_CFLAGS="-march=$CPU"

export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig
export PKG_CONFIG_LIBDIR=${PREFIX}/lib/pkgconfig

export CXX="${CROSS_COMPILE}clang++"
export CC="${CROSS_COMPILE}clang"
# NM="${PREBUILT}/${HOST_TAG}/bin/arm-linux-androideabi-nm"
export STRIP="$PREBUILT/$HOST_TAG/bin/${TARGET_TOOL}-strip"
export RANLIB="$PREBUILT/$HOST_TAG/bin/${TARGET_TOOL}-ranlib"
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
FF_CFG_FLAGS="$FF_CFG_FLAGS --disable-asm"


FF_CFLAGS="$PREFIX/include"
# 必须添加-lm和-lz的依赖
FF_DEP_LIBS="-lm -lz -L$PREFIX/lib"

# 必须添加-lm和-lz的依赖
FF_DEP_LIBS="$FF_DEP_LIBS -lmp3lame -lxml2 -lpng16 -lharfbuzz -lfreetype -liconv -lfribidi -lfontconfig"

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

#pkg-config libass --libs
#pkg-config freetype2 --libs
#pkg-config harfbuzz --libs

#exit 0
./configure $FF_CFG_FLAGS --prefix=$PREFIX \
--cc=$CC \
--cxx=$CXX \
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
#exit 0
if [ $? -ne 0 ];then
    echo "configure ffmpeg error!"
    exit 1
fi

make || exit 1
make install || exit 1


