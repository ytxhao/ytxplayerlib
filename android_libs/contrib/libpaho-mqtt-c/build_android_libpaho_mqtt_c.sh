# libxml2-2.9.10
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

CMAKE_TARGET=

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
  CMAKE_TARGET=armv7a
}

fun_build_config_arm64() {
  echo "build target arm64 config"
  # Application Binary Interface (ABI)
  ABI=arm64-v8a
  ARCH=arm64
  TARGET=aarch64-linux-android
  TARGET_TOOL=aarch64-linux-android
  HOST=arm-linux-android
  CMAKE_TARGET=arm64
}

fun_build_config_x86() {
  echo "build target x86 config"
  # Application Binary Interface (ABI)
  ABI=x86
  ARCH=x86
  TARGET=i686-linux-android
  TARGET_TOOL=i686-linux-android
  HOST=x86-linux-android
  CMAKE_TARGET=x86
}

fun_build_config_x86_64() {
  echo "build target x86_64 config"
  # Application Binary Interface (ABI)
  ABI=x86_64
  ARCH=x86_64
  TARGET=x86_64-linux-android
  TARGET_TOOL=x86_64-linux-android
  HOST=x86-linux-android
  CMAKE_TARGET=x86_64
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

CROSS_COMPILE=$PREBUILT/$HOST_TAG/bin/${TARGET}${API}-

SYSROOT=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/$HOST_TAG/sysroot

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

rm -rf paho.mqtt.c-1.3.9

tar -xzvf paho.mqtt.c-1.3.9.tar.gz

cd paho.mqtt.c-1.3.9

patch -p1 < ../paho-mqtt-c.patch

rm -rf build

mkdir build

cd build


# cmake -DCMAKE_TOOLCHAIN_FILE=../../arm_linux_setup.cmake -Dtgt=${CMAKE_TARGET} -DCMAKE_INSTALL_PREFIX=${PREFIX} -DCMAKE_PREFIX_PATH=${PREFIX} -DCMAKE_C_LINK_EXECUTABLE=${CROSS_COMPILE}clang ..

# cmake -DCMAKE_TOOLCHAIN_FILE=../../arm_linux_setup.cmake -Dtgt=${CMAKE_TARGET} -DCMAKE_INSTALL_PREFIX=${PREFIX} -DCMAKE_FIND_ROOT_PATH=${PREFIX} ..
cmake -DCMAKE_TOOLCHAIN_FILE=../../arm_linux_setup.cmake -Dtgt=${CMAKE_TARGET} \
-DCMAKE_INSTALL_PREFIX=${PREFIX} \
-DCMAKE_FIND_ROOT_PATH=${PREFIX} \
-DPAHO_WITH_SSL=TRUE \
-DPAHO_BUILD_SAMPLES=TRUE \
-DPAHO_BUILD_STATIC=TRUE \
-DPAHO_BUILD_SHARED=TRUE \
-DPAHO_ENABLE_TESTING=FALSE \
..
# cmake -DCMAKE_TOOLCHAIN_FILE=../../arm_linux_setup.cmake -Dtgt=${CMAKE_TARGET} -DCMAKE_INSTALL_PREFIX=${PREFIX} ..
# cmake -DCMAKE_TOOLCHAIN_FILE=../../arm_linux_setup.cmake -Dtgt=${CMAKE_TARGET} -DBUILD_SHARED_AND_STATIC_LIBS=ON -DCMAKE_INSTALL_PREFIX=${PREFIX} ..
# echo "$CC"


make
make install
