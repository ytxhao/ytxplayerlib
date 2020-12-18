#harfbuzz-2.7.2
export ANDROID_NDK_HOME=/home/vagrant/Android/android-ndk-r21d
HOST_TAG=linux-x86_64
API=26
# Application Binary Interface (ABI)
ABI=armeabi-v7a
ARCH=arm
CPU=armv7-a
TARGET=armv7a-linux-androideabi
PREBUILT=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt
PREFIX=$YTXPLAYER_PATH/android/contrib/jni/jniLibs/$ABI

PLATFORM=$ANDROID_NDK_HOME/platforms/android-26/arch-arm
TOOLCHAIN=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/$HOST_TAG

echo $PREFIX
echo ${PLATFORM}    
CFLAGS="-fpic -lz"

CROSS_COMPILE=$PREBUILT/$HOST_TAG/bin/armv7a-linux-androideabi26-
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
export CXX="${CROSS_COMPILE}clang++ --sysroot=${PLATFORM}"
export CC="${CROSS_COMPILE}clang --sysroot=${PLATFORM}"
export NM="${PREBUILT}/$HOST_TAG/bin/arm-linux-androideabi-nm"
export STRIP="$PREBUILT/$HOST_TAG/bin/arm-linux-androideabi-strip"
export RANLIB="$PREBUILT/$HOST_TAG/bin/arm-linux-androideabi-ranlib"
export AR="$PREBUILT/$HOST_TAG/bin/arm-linux-androideabi-ar"
export LD="$PREBUILT/$HOST_TAG/bin/arm-linux-androideabi-ld"
  # exit 0
./configure --prefix=$PREFIX \
--host=arm-linux \
--with-glib=no \
--with-cairo=no \
--with-icu=no \
--with-glib=no \
--enable-static=yes \
--enable-shared=no \

# --with-sysroot=${TOOLCHAIN}/sysroot \
# --with-freetype=yes \
#--enable-shared=no \
#--with-glib=no \
#--with-freetype=no

make
make install
