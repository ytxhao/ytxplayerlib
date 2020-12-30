#harfbuzz-2.7.2
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

PLATFORM=$ANDROID_NDK_HOME/platforms/android-$API/arch-$ARCH/
TOOLCHAIN=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/$HOST_TAG

echo $PREFIX
echo ${PLATFORM}    
CFLAGS="-fpic -lz"

CROSS_COMPILE=$PREBUILT/$HOST_TAG/bin/${TARGET}${API}-
LDFLAGS=-L${PREFIX}/lib
# export PATH=$PATH

# 两种情况，如果你只是想加上某库的pkg，则选择下面其一：
# export PKG_CONFIG_PATH=/usr/lib/pkgconfig/ 
# 或者 
# export PKG_CONFIG_LIBDIR=/usr/lib/pkgconfig/ 
# 如果你想覆盖掉原来的pkg,选择后者。因为：
# PKG_CONFIG_LIBDIR的优先级比 PKG_CONFIG_PATH 高，所以会覆盖PKG_CONFIG_PATH的设置。

export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig
# 当在交叉编译时，不需要它搜索默认路径，以防止它链接到宿主机上的库
export PKG_CONFIG_LIBDIR=${PREFIX}/lib/pkgconfig
# pkg-config  --variable pc_path pkg-config
# echo $PKG_CONFIG_PATH
# echo $LD_LIBRARY_PATH
# pkg-config --cflags freetype2

# pkg-config --exists --print-errors "freetype2 >= 12.0.6"
# pkg-config --libs cairo
export LDFLAGS="$LDFLAGS"
export CPPFLAGS="$CFLAGS"
export CXXFLAGS="$CFLAGS"
export CXX="${CROSS_COMPILE}clang++"
export CC="${CROSS_COMPILE}clang"

export NM="${PREBUILT}/$HOST_TAG/bin/${TARGET_TOOL}-nm"
export STRIP="$PREBUILT/$HOST_TAG/bin/${TARGET_TOOL}-strip"
export RANLIB="$PREBUILT/$HOST_TAG/bin/${TARGET_TOOL}-ranlib"
export AR="$PREBUILT/$HOST_TAG/bin/${TARGET_TOOL}-ar"
export LD="$PREBUILT/$HOST_TAG/bin/${TARGET_TOOL}-ld"
  # exit 0
./configure --prefix=$PREFIX \
--host=$HOST \
--with-glib=no \
--with-cairo=no \
--with-icu=no \
--with-glib=no \
--with-freetype=yes \
--enable-static=yes \
--enable-shared=yes 

# 使用--with-sysroot设置root路径时编译查找freetype依赖的libpng路径会出现错误
# --with-sysroot=${PLATFORM} \
# --with-sysroot=${TOOLCHAIN}/sysroot \
# --with-freetype=yes \
#--enable-shared=no \
#--with-glib=no \
#--with-freetype=no

if [ $? -ne 0 ];then
    echo "configure harfbuzz error!"
    exit 1
fi

make || exit 1
make install || exit 1
