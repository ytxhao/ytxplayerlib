#!/bin/bash

help() {
  echo "$0 [OPTIONS]"
  echo "  -h: help"
  echo "  -armv7a: "
  echo "  -arm64: "
  echo "  -x86: "
  echo "  -x86_64: "
  echo "  clean: clean project"
}
#variable=yuhaoo
#echo "This $variable is quoted $( echo $variable is not)"
#echo "This $variable is quoted $(echo this "$variable" is too)"

current_dir=$(pwd)
deps_dir="android_libs/contrib"

if [ "$1" = "-h" ]; then
  help
  exit
fi

fun_build_clean() {
  echo "build target clean"
  cd "$current_dir/$deps_dir/libopenssl/openssl-OpenSSL_1_1_1i"
  if [ $? -ne 0 ];then
      echo "cd openssl dir error!"
      exit 1
  fi
  if ! (make clean);then
      echo "make clean openssl error!"
      exit 1
  fi

  cd "$current_dir/$deps_dir/librtmp/rtmpdump-c5f04a5/librtmp"
  if [ $? -ne 0 ];then
      echo "cd librtmp dir error!"
      exit 1
  fi
  if ! (make clean);then
      echo "make clean librtmp error!"
      exit 1
  fi

    cd "$current_dir/$deps_dir/libfdk-aac/fdk-aac-2.0.1"
  if [ $? -ne 0 ];then
      echo "cd libfdk dir error!"
      exit 1
  fi
  if ! (make clean);then
      echo "make clean libfdk error!"
      exit 1
  fi

}

fun_build_armv7a() {
  echo "build target armv7a"
#  cd "$current_dir/$deps_dir/libopenssl/openssl-OpenSSL_1_1_1i"
#  if [ $? -ne 0 ];then
#      echo "cd openssl dir error!"
#      exit 1
#  fi
#  if ! (./build_android_openssl.sh -armv7a); then
#    echo "build openssl target armv7a error!"
#    exit 1
#  fi
  cd "$current_dir/$deps_dir/librtmp/rtmpdump-c5f04a5/librtmp"
  if [ $? -ne 0 ];then
      echo "cd librtmp dir error!"
      exit 1
  fi
  if ! (./build_android_librtmp.sh -armv7a); then
    echo "build openssl target armv7a error!"
    exit 1
  fi

  cd "$current_dir/$deps_dir/libfdk-aac/fdk-aac-2.0.1"
  if [ $? -ne 0 ];then
      echo "cd libfdk dir error!"
      exit 1
  fi
  if ! (./build_android_fdk_aac.sh -armv7a); then
    echo "build libfdk target armv7a error!"
    exit 1
  fi
}

fun_build_arm64() {
  echo "build target arm64"
#  cd "$current_dir/$deps_dir/libopenssl/openssl-OpenSSL_1_1_1i"
#  if [ $? -ne 0 ];then
#      echo "cd openssl dir error!"
#      exit 1
#  fi
#  if ! (./build_android_openssl.sh -arm64); then
#    echo "build openssl target arm64 error!"
#    exit 1
#  fi
  cd "$current_dir/$deps_dir/librtmp/rtmpdump-c5f04a5/librtmp"
  if [ $? -ne 0 ];then
      echo "cd librtmp dir error!"
      exit 1
  fi
  if ! (./build_android_librtmp.sh -arm64); then
    echo "build openssl target arm64 error!"
    exit 1
  fi

  cd "$current_dir/$deps_dir/libfdk-aac/fdk-aac-2.0.1"
  if [ $? -ne 0 ];then
      echo "cd libfdk dir error!"
      exit 1
  fi
  if ! (./build_android_fdk_aac.sh -arm64); then
    echo "build libfdk target arm64 error!"
    exit 1
  fi
}

fun_build_x86() {
  echo "build target x86"
  cd "$current_dir/$deps_dir/libopenssl/openssl-OpenSSL_1_1_1i"
  if [ $? -ne 0 ];then
      echo "cd openssl dir error!"
      exit 1
  fi
  if ! (./build_android_openssl.sh -x86); then
    echo "build openssl target x86 error!"
    exit 1
  fi
  cd "$current_dir/$deps_dir/librtmp/rtmpdump-c5f04a5/librtmp"
  if [ $? -ne 0 ];then
      echo "cd librtmp dir error!"
      exit 1
  fi
  if ! (./build_android_librtmp.sh -x86); then
    echo "build openssl target x86 error!"
    exit 1
  fi

  cd "$current_dir/$deps_dir/libfdk-aac/fdk-aac-2.0.1"
  if [ $? -ne 0 ];then
      echo "cd libfdk dir error!"
      exit 1
  fi
  if ! (./build_android_fdk_aac.sh -x86); then
    echo "build libfdk target x86 error!"
    exit 1
  fi
}

fun_build_x86_64() {
  echo "build target x86_64"
  cd "$current_dir/$deps_dir/libopenssl/openssl-OpenSSL_1_1_1i"
  if [ $? -ne 0 ];then
      echo "cd openssl dir error!"
      exit 1
  fi
  if ! (./build_android_openssl.sh -x86_64); then
    echo "build openssl target x86 error!"
    exit 1
  fi
  cd "$current_dir/$deps_dir/librtmp/rtmpdump-c5f04a5/librtmp"
  if [ $? -ne 0 ];then
      echo "cd librtmp dir error!"
      exit 1
  fi
  if ! (./build_android_librtmp.sh -x86_64); then
    echo "build openssl target x86_64 error!"
    exit 1
  fi

  cd "$current_dir/$deps_dir/libfdk-aac/fdk-aac-2.0.1"
  if [ $? -ne 0 ];then
      echo "cd libfdk dir error!"
      exit 1
  fi
  if ! (./build_android_fdk_aac.sh -x86_64); then
    echo "build libfdk target x86_64 error!"
    exit 1
  fi
}

if [ "$1" = "clean" ]; then
  fun_build_clean
fi

if [ "$1" = "-armv7a" ] || [ "$2" = "-armv7a" ]; then
  fun_build_armv7a
elif [ "$1" = "-arm64" ] || [ "$2" = "-arm64" ]; then
  fun_build_arm64
elif [ "$1" = "-x86" ] || [ "$2" = "-x86" ]; then
  fun_build_x86
elif [ "$1" = "-x86_64" ] || [ "$2" = "-x86_64" ]; then
  fun_build_x86_64
fi
