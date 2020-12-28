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
  cd "$current_dir/$deps_dir/libopenssl/openssl-OpenSSL_1_1_1i" || exit 1
  make clean
#  if [ "$?" -ne 0 ];then
#      echo "make clean openssl error!"
#      exit 1
#  fi
  if ! (make clean);then
        echo "make clean openssl error!"
        exit 1
  fi
}

fun_build_armv7a() {
  echo "build target armv7a"
  cd "$current_dir/$deps_dir/libopenssl/openssl-OpenSSL_1_1_1i" || exit 1
  sh build_android_openssl.sh -armv7a
  cd "$current_dir" || exit 1
}

fun_build_arm64() {
  echo "build target arm64"
  cd "$current_dir/$deps_dir/libopenssl/openssl-OpenSSL_1_1_1i" || exit 1
  sh build_android_openssl.sh -arm64
  cd "$current_dir" || exit 1
}

fun_build_x86() {
  echo "build target x86"
  cd "$current_dir/$deps_dir/libopenssl/openssl-OpenSSL_1_1_1i" || exit 1
  if ! (./build_android_openssl.sh -x86); then
    echo "build openssl target x86 error!"
    exit 1
  fi
  cd "$current_dir" || exit 1
}

fun_build_x86_64() {
  echo "build target x86_64"
  cd "$current_dir/$deps_dir/libopenssl/openssl-OpenSSL_1_1_1i" || exit 1
  sh build_android_openssl.sh -x86_64
  cd "$current_dir" || exit 1
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
