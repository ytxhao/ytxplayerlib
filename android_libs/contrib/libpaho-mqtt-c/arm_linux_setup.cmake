set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR arm)

set(HOST_TAG "linux-x86_64")
set(API "26")

set(ABI "")
set(ARCH "")
set(TARGET "")
set(TARGET_TOOL "")
set(HOST "")

function (build_config tgt)

	if (tgt STREQUAL x86) 
		set(ABI "x86" PARENT_SCOPE)
		set(ARCH "x86" PARENT_SCOPE)
		set(TARGET "i686-linux-android" PARENT_SCOPE)
		set(TARGET_TOOL "i686-linux-android" PARENT_SCOPE)
		set(HOST "x86-linux-android" PARENT_SCOPE)
	elseif (tgt STREQUAL x86_64)
		set(ABI "x86_64" PARENT_SCOPE)
		set(ARCH "x86_64" PARENT_SCOPE)
		set(TARGET "x86_64-linux-android" PARENT_SCOPE)
		set(TARGET_TOOL "x86_64-linux-android" PARENT_SCOPE)
		set(HOST "x86-linux-android" PARENT_SCOPE)
	elseif (tgt STREQUAL arm64)
		set(ABI "arm64-v8a" PARENT_SCOPE)
		set(ARCH "arm64" PARENT_SCOPE)
		set(TARGET "aarch64-linux-android" PARENT_SCOPE)
		set(TARGET_TOOL "aarch64-linux-android" PARENT_SCOPE)
		set(HOST "arm-linux-android" PARENT_SCOPE)
	elseif (tgt STREQUAL armv7a)
		set(ABI "armeabi-v7a" PARENT_SCOPE)
		set(ARCH "arm" PARENT_SCOPE)
		set(TARGET "armv7a-linux-androideabi" PARENT_SCOPE)
		set(TARGET_TOOL "arm-linux-androideabi" PARENT_SCOPE)
		set(HOST "arm-linux-android" PARENT_SCOPE)
	endif()
endfunction()

build_config("${tgt}")

set(PREBUILT "$ENV{ANDROID_NDK_HOME}/toolchains/llvm/prebuilt")
set(PLATFORM "$ENV{ANDROID_NDK_HOME}/platforms/android-${API}/arch-${ARCH}/")
set(TOOLCHAIN "$ENV{ANDROID_NDK_HOME}/toolchains/llvm/prebuilt/${HOST_TAG}")
set(CROSS_COMPILE "${PREBUILT}/${HOST_TAG}/bin/${TARGET}${API}-")
# set(CMAKE_INSTALL_PREFIX "${CMAKE_SOURCE_DIR}/../../../../build/output/jniLibs/${ABI}")

# #set(tools /home/wh/work/cross_compile/gcc-linaro-7.3.1-2018.05-x86_64_arm-linux-gnueabihf)
set(CMAKE_SYSROOT "$ENV{ANDROID_NDK_HOME}/toolchains/llvm/prebuilt/${HOST_TAG}/sysroot")
set(CMAKE_C_COMPILER ${CROSS_COMPILE}clang)
set(CMAKE_CXX_COMPILER ${CROSS_COMPILE}clang++)
# SET(CMAKE_C_LINK_EXECUTABLE ${CROSS_COMPILE}clang)


#指定pkg-config.exe绝对路径
# set(PKG_CONFIG_EXECUTABLE "D:/soft/pkg-config/bin/pkg-config.exe")

#指定zlib.pc所在目录
# set(ENV{PKG_CONFIG_PATH} "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig")

# find_library(SSL_LIB ssl)
# find_library(CRYPTO_LIB crypto)

# FIND_PACKAGE(PkgConfig REQUIRED)
# PKG_SEARCH_MODULE(PKG_OPENSSL REQUIRED openssl)
# include_directories(${PKG_OPENSSL_INCLUDE_DIRS})
# find_package(PkgConfig)
# message(STATUS "--- haoo PKG_CONFIG_FOUND: ${PKG_CONFIG_FOUND}")
# message(STATUS "--- haoo PKG_CONFIG_VERSION_STRING: ${PKG_CONFIG_VERSION_STRING}")

# pkg_search_module(ZLIB REQUIRED zlib)

# message(STATUS "=== haoo PKG_OPENSSL_LIBRARIES: ${PKG_OPENSSL_LIBRARIES}")
# message(STATUS "=== haoo PKG_OPENSSL_INCLUDE_DIRS: ${PKG_OPENSSL_INCLUDE_DIRS}")
# set(NO_SONAME ON)
# set(BUILD_SHARED_AND_STATIC_LIBS ON)

# CMAKE_INCLUDE_PATH

message(STATUS "WARNING haoo CMAKE_INCLUDE_PATH: ${CMAKE_INCLUDE_PATH}")
message(STATUS "WARNING haoo CMAKE_LIBRARY_PATH: ${CMAKE_LIBRARY_PATH}")
message(STATUS "WARNING haoo CMAKE_INSTALL_PREFIX: ${CMAKE_INSTALL_PREFIX}")

# message(STATUS "WARNING haoo PLATFORM: ${PLATFORM}")
# message(STATUS "WARNING haoo TOOLCHAIN: ${TOOLCHAIN}")
# message(STATUS "WARNING haoo CROSS_COMPILE: ${CROSS_COMPILE}")
# message(STATUS "WARNING haoo CMAKE_SYSROOT: ${CMAKE_SYSROOT}")
# message(STATUS "WARNING haoo CMAKE_C_COMPILER: ${CMAKE_C_COMPILER}")
# message(STATUS "WARNING haoo CMAKE_CXX_COMPILER: ${CMAKE_CXX_COMPILER}")
# message(STATUS "WARNING haoo CMAKE_INSTALL_PREFIX: ${CMAKE_INSTALL_PREFIX}")
