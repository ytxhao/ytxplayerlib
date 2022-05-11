#libpng
export ANDROID_NDK_HOME=/Users/yuhaoo/Library/Android/sdk/ndk/23.1.7779620
YTXPLAYER_PATH=$(git rev-parse --show-toplevel)
HOST_TAG=darwin-x86_64
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

PLATFORM=$ANDROID_NDK_HOME/platforms/android-$API/arch-$ARCH/
TOOLCHAIN=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/$HOST_TAG

echo $PREFIX
     
CFLAGS="-fpic -DANDROID -ffunction-sections -msoft-float -lm"

CROSS_COMPILE=$PREBUILT/$HOST_TAG/bin/${TARGET}${API}-

LDFLAGS=-L${PREFIX}/lib

export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig
export PKG_CONFIG_LIBDIR=${PREFIX}/lib/pkgconfig

export CXX="${CROSS_COMPILE}clang++ --sysroot=${TOOLCHAIN}/sysroot ${LDFLAGS}"
export CC="${CROSS_COMPILE}clang --sysroot=${TOOLCHAIN}/sysroot ${LDFLAGS}"

export NM="${PREBUILT}/$HOST_TAG/bin/llvm-nm"
export STRIP="$PREBUILT/$HOST_TAG/bin/llvm-strip"
export RANLIB="$PREBUILT/$HOST_TAG/bin/llvm-ranlib"
export AR="$PREBUILT/$HOST_TAG/bin/llvm-ar"
# export LD="$PREBUILT/$HOST_TAG/bin/${TARGET_TOOL}-ld"
## NDK 22 版本以后默认的连接器改为了lld，同时 ndk-build 和 cmake 工具链也迁移去使用llvm-ar,llvm-strip了
#参考网址：
# https://developer.android.com/ndk/downloads/revision_history
# https://github.com/android/ndk/wiki/Changelog-r22
#LLD is now the default linker. ndk-build and our CMake toolchain file have also migrated to using llvm-ar and llvm-strip.
export LD="$PREBUILT/$HOST_TAG/bin/ld"

# 需要安装 pkg-config

./configure --prefix=$PREFIX \
--host=$HOST \
--with-openssl

if [ $? -ne 0 ];then
    echo "configure libcurl error!"
    exit 1
fi

make -j4 || exit 1
make install || exit 1

# cp .libs/libpng.so  .libs/libpng.a ${PREFIX}/lib
# rm ${PREFIX}/lib/pkgconfig/libpng.pc
# cp libpng.pc ${PREFIX}/lib/pkgconfig
