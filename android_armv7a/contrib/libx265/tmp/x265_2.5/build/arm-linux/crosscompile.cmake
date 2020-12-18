# CMake toolchain file for cross compiling x265 for ARM arch
# This feature is only supported as experimental. Use with caution.
# Please report bugs on bitbucket
# Run cmake with: cmake -DCMAKE_TOOLCHAIN_FILE=crosscompile.cmake -G "Unix Makefiles" ../../source && ccmake ../../source

set(CROSS_COMPILE_ARM 1)
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR armv6l)

# specify the cross compiler
set(CMAKE_C_COMPILER arm-linux-androideabi-gcc)
set(CMAKE_CXX_COMPILER arm-linux-androideabi-g++)

# specify the target environment
SET(CMAKE_FIND_ROOT_PATH  /home/yuhao/android/ndk/android-ndk-r14b/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin/arm-linux-androideabi)
