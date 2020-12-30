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

fun_build_clean_openssl() {
  echo "build target clean"
  cd "$current_dir/$deps_dir/libopenssl/openssl-OpenSSL_1_1_1i"
  if [ $? -ne 0 ];then
      echo "cd openssl dir error!"
      exit 1
  fi
  if ! (./build_android_openssl.sh clean);then
      echo "make clean openssl error!"
      exit 1
  fi
}

fun_build_clean_rtmp() {
  cd "$current_dir/$deps_dir/librtmp/rtmpdump-c5f04a5/librtmp"
  if [ $? -ne 0 ];then
      echo "cd librtmp dir error!"
      exit 1
  fi
  if ! (./build_android_librtmp.sh clean);then
      echo "make clean librtmp error!"
      exit 1
  fi
}

fun_build_clean_fdk_aac() {
  cd "$current_dir/$deps_dir/libfdk-aac/fdk-aac-2.0.1"
  if [ $? -ne 0 ];then
      echo "cd libfdk dir error!"
      exit 1
  fi
  if ! (./build_android_fdk_aac.sh clean);then
      echo "make clean libfdk error!"
      exit 1
  fi
}

fun_build_clean_faad2() {
  cd "$current_dir/$deps_dir/libfaad2/faad2-2.8.8"
  if [ $? -ne 0 ];then
      echo "cd libfaad2 dir error!"
      exit 1
  fi
  if ! (./build_android_faad2.sh clean);then
      echo "make clean libfaad2 error!"
      exit 1
  fi
}

fun_build_clean_x264() {
  cd "$current_dir/$deps_dir/libx264/x264-stable"
  if [ $? -ne 0 ];then
      echo "cd libx264 dir error!"
      exit 1
  fi
  if ! (./build_android_x264.sh clean);then
      echo "make clean libx264 error!"
      exit 1
  fi
}

fun_build_clean_iconv() {
  cd "$current_dir/$deps_dir/libiconv/libiconv-1.15"
  if [ $? -ne 0 ];then
      echo "cd libiconv dir error!"
      exit 1
  fi
  if ! (./build_android_libiconv.sh clean);then
      echo "make clean libiconv error!"
      exit 1
  fi
}

fun_build_clean_xml() {
  cd "$current_dir/$deps_dir/libxml/libxml2-2.9.10"
  if [ $? -ne 0 ];then
      echo "cd libxml2 dir error!"
      exit 1
  fi
  if ! (./build_android_libxml.sh clean);then
      echo "make clean libxml2 error!"
      exit 1
  fi
}

fun_build_clean_libpng() {
  cd "$current_dir/$deps_dir/libpng/libpng-1.6.37"
  if [ $? -ne 0 ];then
      echo "cd libpng dir error!"
      exit 1
  fi
  if ! (./build_android_libpng.sh clean);then
      echo "make clean libpng error!"
      exit 1
  fi
}
fun_build_clean_fribidi() {
  cd "$current_dir/$deps_dir/libfribidi/fribidi-1.0.9"
  if [ $? -ne 0 ];then
      echo "cd libfribidi dir error!"
      exit 1
  fi
  if ! (./build_android_fribidi.sh clean);then
      echo "make clean libfribidi error!"
      exit 1
  fi
}
fun_build_clean_freetype() {
  cd "$current_dir/$deps_dir/libfreetype/freetype-2.10.4"
  if [ $? -ne 0 ];then
      echo "cd libfreetype dir error!"
      exit 1
  fi
  if ! (./build_android_freetype_step1.sh clean);then
      echo "make clean libfreetype error!"
      exit 1
  fi
}
fun_build_clean_fontconfig() {
  cd "$current_dir/$deps_dir/libfontconfig/fontconfig-2.13.91"
  if [ $? -ne 0 ];then
      echo "cd libfontconfig dir error!"
      exit 1
  fi
  if ! (./build_android_fontconfig.sh clean);then
      echo "make clean libfontconfig error!"
      exit 1
  fi
}

fun_build_clean_harfbuzz() {
  cd "$current_dir/$deps_dir/libharfbuzz/harfbuzz-2.7.2"
  if [ $? -ne 0 ];then
      echo "cd libharfbuzz dir error!"
      exit 1
  fi
  if ! (./build_android_harfbuzz.sh clean);then
      echo "make clean libharfbuzz error!"
      exit 1
  fi

}

fun_build_clean_libass() {
  cd "$current_dir/$deps_dir/libass/libass-0.15.0"
  if [ $? -ne 0 ];then
      echo "cd libass dir error!"
      exit 1
  fi
  if ! (./build_android_libass.sh clean);then
      echo "make clean libass error!"
      exit 1
  fi

}
fun_build_clean_lame() {
  cd "$current_dir/$deps_dir/liblame/lame-3.100"
  if [ $? -ne 0 ];then
      echo "cd liblame dir error!"
      exit 1
  fi
  if ! (./build_android_lame.sh clean);then
      echo "make clean liblame error!"
      exit 1
  fi

}
fun_build_clean_ffmpeg() {

  cd "$current_dir/$deps_dir/libffmpeg/ffmpeg-4.3.1"
  if [ $? -ne 0 ];then
      echo "cd libffmpeg dir error!"
      exit 1
  fi
  if ! (./build_android_ffmpeg.sh clean);then
      echo "make clean libffmpeg error!"
      exit 1
  fi

}

fun_build_clean() {
  fun_build_clean_openssl
  fun_build_clean_rtmp
  fun_build_clean_fdk_aac
  fun_build_clean_faad2
  fun_build_clean_x264
  fun_build_clean_iconv
  fun_build_clean_xml
  fun_build_clean_libpng
  fun_build_clean_fribidi
  fun_build_clean_freetype
  fun_build_clean_fontconfig
  fun_build_clean_harfbuzz
  fun_build_clean_libass
  fun_build_clean_lame
  fun_build_clean_ffmpeg
}

fun_build_armv7a() {
  echo "build target armv7a"
#  fun_build_clean_openssl
#  cd "$current_dir/$deps_dir/libopenssl/openssl-OpenSSL_1_1_1i"
#  if [ $? -ne 0 ];then
#      echo "cd openssl dir error!"
#      exit 1
#  fi
#  if ! (./build_android_openssl.sh -armv7a); then
#    echo "build openssl target armv7a error!"
#    exit 1
#  fi
#
#  fun_build_clean_rtmp
#  cd "$current_dir/$deps_dir/librtmp/rtmpdump-c5f04a5/librtmp"
#  if [ $? -ne 0 ];then
#      echo "cd librtmp dir error!"
#      exit 1
#  fi
#  if ! (./build_android_librtmp.sh -armv7a); then
#    echo "build librtmp target armv7a error!"
#    exit 1
#  fi
#
#  fun_build_clean_fdk_aac
#  cd "$current_dir/$deps_dir/libfdk-aac/fdk-aac-2.0.1"
#  if [ $? -ne 0 ];then
#      echo "cd libfdk dir error!"
#      exit 1
#  fi
#  if ! (./build_android_fdk_aac.sh -armv7a); then
#    echo "build libfdk target armv7a error!"
#    exit 1
#  fi
#
#  fun_build_clean_faad2
#  cd "$current_dir/$deps_dir/libfaad2/faad2-2.8.8"
#  if [ $? -ne 0 ];then
#      echo "cd faad2 dir error!"
#      exit 1
#  fi
#  if ! (./build_android_faad2.sh -armv7a); then
#    echo "build faad2 target armv7a error!"
#    exit 1
#  fi
#
#  fun_build_clean_x264
#  cd "$current_dir/$deps_dir/libx264/x264-stable"
#  if [ $? -ne 0 ];then
#      echo "cd x264 dir error!"
#      exit 1
#  fi
#  if ! (./build_android_x264.sh -armv7a); then
#    echo "build x264 target armv7a error!"
#    exit 1
#  fi
#
#  fun_build_clean_iconv
#  cd "$current_dir/$deps_dir/libiconv/libiconv-1.15"
#  if [ $? -ne 0 ];then
#      echo "cd iconv dir error!"
#      exit 1
#  fi
#  if ! (./build_android_libiconv.sh -armv7a); then
#    echo "build iconv target armv7a error!"
#    exit 1
#  fi
#
#  fun_build_clean_xml
#  cd "$current_dir/$deps_dir/libxml/libxml2-2.9.10"
#  if [ $? -ne 0 ];then
#      echo "cd xml dir error!"
#      exit 1
#  fi
#  if ! (./build_android_libxml.sh -armv7a); then
#    echo "build xml target armv7a error!"
#    exit 1
#  fi
#
#  fun_build_clean_libpng
#  cd "$current_dir/$deps_dir/libpng/libpng-1.6.37"
#  if [ $? -ne 0 ];then
#      echo "cd libpng dir error!"
#      exit 1
#  fi
#  if ! (./build_android_libpng.sh -armv7a); then
#    echo "build libpng target armv7a error!"
#    exit 1
#  fi
#
#  fun_build_clean_fribidi
#  cd "$current_dir/$deps_dir/libfribidi/fribidi-1.0.9"
#  if [ $? -ne 0 ];then
#      echo "cd fribidi dir error!"
#      exit 1
#  fi
#  if ! (./build_android_fribidi.sh -armv7a); then
#    echo "build fribidi target armv7a error!"
#    exit 1
#  fi
#
#  fun_build_clean_freetype
#  cd "$current_dir/$deps_dir/libfreetype/freetype-2.10.4"
#  if [ $? -ne 0 ];then
#      echo "cd freetype dir error!"
#      exit 1
#  fi
#  if ! (./build_android_freetype_step1.sh -armv7a); then
#    echo "build freetype target armv7a error!"
#    exit 1
#  fi
#
#  fun_build_clean_fontconfig
#  cd "$current_dir/$deps_dir/libfontconfig/fontconfig-2.13.91"
#  if [ $? -ne 0 ];then
#      echo "cd fontconfig dir error!"
#      exit 1
#  fi
#  if ! (./build_android_fontconfig.sh -armv7a); then
#    echo "build fontconfig target armv7a error!"
#    exit 1
#  fi
#
#  fun_build_clean_harfbuzz
#  cd "$current_dir/$deps_dir/libharfbuzz/harfbuzz-2.7.2"
#  if [ $? -ne 0 ];then
#      echo "cd harfbuzz dir error!"
#      exit 1
#  fi
#  if ! (./build_android_harfbuzz.sh -armv7a); then
#    echo "build harfbuzz target armv7a error!"
#    exit 1
#  fi
#
  fun_build_clean_freetype
  cd "$current_dir/$deps_dir/libfreetype/freetype-2.10.4"
  if [ $? -ne 0 ];then
      echo "cd freetype 2 dir error!"
      exit 1
  fi
  if ! (./build_android_freetype_step2_after_build_harfbuzz.sh -armv7a); then
    echo "build freetype 2 target armv7a error!"
    exit 1
  fi

  fun_build_clean_libass
  cd "$current_dir/$deps_dir/libass/libass-0.15.0"
  if [ $? -ne 0 ];then
      echo "cd libass dir error!"
      exit 1
  fi
  if ! (./build_android_libass.sh -armv7a); then
    echo "build libass target armv7a error!"
    exit 1
  fi

  fun_build_clean_lame
  cd "$current_dir/$deps_dir/liblame/lame-3.100"
  if [ $? -ne 0 ];then
      echo "cd lame dir error!"
      exit 1
  fi
  if ! (./build_android_lame.sh -armv7a); then
    echo "build lame target armv7a error!"
    exit 1
  fi

  fun_build_clean_ffmpeg
  cd "$current_dir/$deps_dir/libffmpeg/ffmpeg-4.3.1"
  if [ $? -ne 0 ];then
      echo "cd ffmpeg dir error!"
      exit 1
  fi
  if ! (./build_android_ffmpeg.sh -armv7a); then
    echo "build ffmpeg target armv7a error!"
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
  exit 0
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
