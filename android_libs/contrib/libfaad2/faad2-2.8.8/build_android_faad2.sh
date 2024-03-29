#faad2-2.8.8
#使用环境变量中的ANDROID_NDK_HOME
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
TOOLCHAIN=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/$HOST_TAG
SYSROOT=$ANDROID_NDK_HOME/platforms/android-$API/arch-$ARCH/
# SYSROOT=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/$HOST_TAG
CROSS_COMPILE=$PREBUILT/$HOST_TAG/bin/${TARGET}${API}-


export CFLAGS="-fpic -lm"
# export CFLAGS="-fpic"


# export CPPFLAGS="$CFLAGS"
# export CFLAGS="$CFLAGS"
# export CXXFLAGS="$CFLAGS"
# export CXX="${CROSS_COMPILE}g++ --sysroot=${PLATFORM}"
# export LDFLAGS="$LDFLAGS"
# export CC="${CROSS_COMPILE}gcc --sysroot=${PLATFORM}"
# export NM="${CROSS_COMPILE}nm"
# export STRIP="${CROSS_COMPILE}strip"
# export RANLIB="${CROSS_COMPILE}ranlib"
# export AR="${CROSS_COMPILE}ar"

LDFLAGS="-L${PREFIX}/lib"

export CPPFLAGS="$CFLAGS"
export CXXFLAGS="$CFLAGS"

# export LDFLAGS="$LDFLAGS -L${PREBUILT}/darwin-x86_64/sysroot/usr/lib/arm-linux-androideabi/26/"
export LDFLAGS="$LDFLAGS"
echo $LDFLAGS
# export CC="${CROSS_COMPILE}clang --sysroot=${PLATFORM}"
export CC="${CROSS_COMPILE}clang"
export CXX="${CROSS_COMPILE}clang++"

export NM="${PREBUILT}/$HOST_TAG/bin/${TARGET_TOOL}-nm"
export STRIP="$PREBUILT/$HOST_TAG/bin/${TARGET_TOOL}-strip"
export RANLIB="$PREBUILT/$HOST_TAG/bin/${TARGET_TOOL}-ranlib"
export AR="$PREBUILT/$HOST_TAG/bin/${TARGET_TOOL}-ar"
export LD="$PREBUILT/$HOST_TAG/bin/${TARGET_TOOL}-ld"
# export LD="${CROSS_COMPILE}clang"

./configure --prefix=$PREFIX \
--host=$HOST \
--disable-asm \
--enable-pic \


#--with-sysroot=${SYSROOT}

if [ $? -ne 0 ];then
    echo "configure faad2 error!"
    exit 1
fi

make || exit 1
make install || exit 1

