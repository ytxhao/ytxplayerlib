#libass-0.15.0
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

echo $PREFIX
echo ${PLATFORM}
#CFLAGS="-fpic -DANDROID -ffunction-sections -msoft-float -lm"
CFLAGS="-fpic -I${PREFIX}/include"

LDFLAGS=-L${PREFIX}/lib
export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig
export PKG_CONFIG_LIBDIR=${PREFIX}/lib/pkgconfig
export CPPFLAGS="$CFLAGS"
export CXXFLAGS="$CFLAGS"
export CFLAGS="$CFLAGS"
export LDFLAGS="$LDFLAGS"

# export CXX="${CROSS_COMPILE}clang++ --sysroot=${TOOLCHAIN}/sysroot"
# export CC="${CROSS_COMPILE}clang --sysroot=${TOOLCHAIN}/sysroot"
# export NM="${PREBUILT}/$HOST_TAG/bin/arm-linux-androideabi-nm"
# export STRIP="$PREBUILT/$HOST_TAG/bin/arm-linux-androideabi-strip"
# export RANLIB="$PREBUILT/$HOST_TAG/bin/arm-linux-androideabi-ranlib"
# export AR="$PREBUILT/$HOST_TAG/bin/arm-linux-androideabi-ar"
# export LD="$PREBUILT/$HOST_TAG/bin/arm-linux-androideabi-ld"

export CXX="${CROSS_COMPILE}clang++"
export CC="${CROSS_COMPILE}clang"

export NM="${PREBUILT}/$HOST_TAG/bin/${TARGET_TOOL}-nm"
export STRIP="$PREBUILT/$HOST_TAG/bin/${TARGET_TOOL}-strip"
export RANLIB="$PREBUILT/$HOST_TAG/bin/${TARGET_TOOL}-ranlib"
export AR="$PREBUILT/$HOST_TAG/bin/${TARGET_TOOL}-ar"
export LD="$PREBUILT/$HOST_TAG/bin/${TARGET_TOOL}-ld"

#  --with-sysroot[=DIR]    Search for dependent libraries within DIR (or the
#                          compiler's sysroot if not specified).
# 注释掉 --with-sysroot，否则编译时会去指定的 sysroot 查找三方依赖库

./configure --prefix=$PREFIX \
--host=$HOST \
--enable-shared=yes \
--enable-static=yes

#--disable-harfbuzz
#--with-sysroot=${PLATFORM}

if [ $? -ne 0 ];then
    echo "configure libass error!"
    exit 1
fi

make || exit 1
make install || exit 1
