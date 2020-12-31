#!/bin/bash

show_help() {
  echo "$0 [OPTIONS]"
  cat <<EOF
  --help              print this message
  --build=armv7a      build armv7a
  --build=arm64       build arm64
  --build=x86         build x86
  --build=x86_64      build x86_64
  --enable-clean      clean sub project before build it
  clean               clean all project
EOF
  exit 0
}

current_dir=$(pwd)
deps_dir="android_libs/contrib"

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
  exit 0
}


fun_build_openssl() {
  cd "$current_dir/$deps_dir/libopenssl/openssl-OpenSSL_1_1_1i"
  if [ $? -ne 0 ];then
      echo "cd openssl dir error!"
      exit 1
  fi
  if ! (./build_android_openssl.sh $1); then
    echo "build openssl target $1 error!"
    exit 1
  fi
}

fun_build_rtmp() {
  cd "$current_dir/$deps_dir/librtmp/rtmpdump-c5f04a5/librtmp"
  if [ $? -ne 0 ];then
      echo "cd librtmp dir error!"
      exit 1
  fi
  if ! (./build_android_librtmp.sh $1); then
    echo "build librtmp target $1 error!"
    exit 1
  fi
}

fun_build_fdk_aac() {
  cd "$current_dir/$deps_dir/libfdk-aac/fdk-aac-2.0.1"
  if [ $? -ne 0 ];then
      echo "cd libfdk dir error!"
      exit 1
  fi
  if ! (./build_android_fdk_aac.sh $1); then
    echo "build libfdk target $1 error!"
    exit 1
  fi
}

fun_build_faad2() {
  cd "$current_dir/$deps_dir/libfaad2/faad2-2.8.8"
  if [ $? -ne 0 ];then
      echo "cd faad2 dir error!"
      exit 1
  fi
  if ! (./build_android_faad2.sh $1); then
    echo "build faad2 target $1 error!"
    exit 1
  fi
}

fun_build_x264() {
  cd "$current_dir/$deps_dir/libx264/x264-stable"
  if [ $? -ne 0 ];then
      echo "cd x264 dir error!"
      exit 1
  fi
  if ! (./build_android_x264.sh $1); then
    echo "build x264 target $1 error!"
    exit 1
  fi
}

fun_build_iconv() {
  cd "$current_dir/$deps_dir/libiconv/libiconv-1.15"
  if [ $? -ne 0 ];then
      echo "cd iconv dir error!"
      exit 1
  fi
  if ! (./build_android_libiconv.sh $1); then
    echo "build iconv target $1 error!"
    exit 1
  fi
}

fun_build_xml() {
  cd "$current_dir/$deps_dir/libxml/libxml2-2.9.10"
  if [ $? -ne 0 ];then
      echo "cd xml dir error!"
      exit 1
  fi
  if ! (./build_android_libxml.sh $1); then
    echo "build xml target $1 error!"
    exit 1
  fi
}

fun_build_libpng() {
  cd "$current_dir/$deps_dir/libpng/libpng-1.6.37"
  if [ $? -ne 0 ];then
      echo "cd libpng dir error!"
      exit 1
  fi
  if ! (./build_android_libpng.sh $1); then
    echo "build libpng target $1 error!"
    exit 1
  fi
}

fun_build_fribidi() {
  cd "$current_dir/$deps_dir/libfribidi/fribidi-1.0.9"
  if [ $? -ne 0 ];then
      echo "cd fribidi dir error!"
      exit 1
  fi
  if ! (./build_android_fribidi.sh $1); then
    echo "build fribidi target $1 error!"
    exit 1
  fi
}

fun_build_freetype_step1() {
  cd "$current_dir/$deps_dir/libfreetype/freetype-2.10.4"
  if [ $? -ne 0 ];then
      echo "cd freetype dir error!"
      exit 1
  fi
  if ! (./build_android_freetype_step1.sh $1); then
    echo "build freetype target $1 error!"
    exit 1
  fi
}

fun_build_fontconfig() {
  cd "$current_dir/$deps_dir/libfontconfig/fontconfig-2.13.91"
  if [ $? -ne 0 ];then
      echo "cd fontconfig dir error!"
      exit 1
  fi
  if ! (./build_android_fontconfig.sh $1); then
    echo "build fontconfig target $1 error!"
    exit 1
  fi
}

fun_build_harfbuzz() {
  cd "$current_dir/$deps_dir/libharfbuzz/harfbuzz-2.7.2"
  if [ $? -ne 0 ];then
      echo "cd harfbuzz dir error!"
      exit 1
  fi
  if ! (./build_android_harfbuzz.sh $1); then
    echo "build harfbuzz target $1 error!"
    exit 1
  fi
}

fun_build_freetype_step2() {
  cd "$current_dir/$deps_dir/libfreetype/freetype-2.10.4"
  if [ $? -ne 0 ];then
      echo "cd freetype 2 dir error!"
      exit 1
  fi
  if ! (./build_android_freetype_step2_after_build_harfbuzz.sh $1); then
    echo "build freetype 2 target $1 error!"
    exit 1
  fi
}

fun_build_libass() {
  cd "$current_dir/$deps_dir/libass/libass-0.15.0"
  if [ $? -ne 0 ];then
      echo "cd libass dir error!"
      exit 1
  fi
  if ! (./build_android_libass.sh $1); then
    echo "build libass target $1 error!"
    exit 1
  fi
}

fun_build_lame() {
  cd "$current_dir/$deps_dir/liblame/lame-3.100"
  if [ $? -ne 0 ];then
      echo "cd lame dir error!"
      exit 1
  fi
  if ! (./build_android_lame.sh $1); then
    echo "build lame target $1 error!"
    exit 1
  fi
}

fun_build_ffmpeg() {
  cd "$current_dir/$deps_dir/libffmpeg/ffmpeg-4.3.1"
  if [ $? -ne 0 ];then
      echo "cd ffmpeg dir error!"
      exit 1
  fi
  if ! (./build_android_ffmpeg.sh $1); then
    echo "build ffmpeg target $1 error!"
    exit 1
  fi
}

fun_build_android_libs() {
  echo "build target param1=$1 param2=$2"
  if [ $1 = true ]; then
    echo "build clean openssl"
    fun_build_clean_openssl
  fi
  fun_build_openssl $2

  if [ $1 = true ]; then
    echo "build clean rtmp"
    fun_build_clean_rtmp
  fi
  fun_build_rtmp $2

  if [ $1 = true ]; then
    echo "build clean fdk_aac"
    fun_build_clean_fdk_aac
  fi
  fun_build_fdk_aac $2

  if [ $1 = true ]; then
    echo "build clean faad2"
  fun_build_clean_faad2
  fi
  fun_build_faad2 $2

  if [ $1 = true ]; then
    echo "build clean x264"
    fun_build_clean_x264
  fi
  fun_build_x264 $2

  if [ $1 = true ]; then
    echo "build clean iconv"
    fun_build_clean_iconv
  fi
  fun_build_iconv $2

  if [ $1 = true ]; then
    echo "build clean xml"
  fun_build_clean_xml
  fi
  fun_build_xml $2

  if [ $1 = true ]; then
    echo "build clean libpng"
  fun_build_clean_libpng
  fi
  fun_build_libpng $2

  if [ $1 = true ]; then
    echo "build clean fribidi"
  fun_build_clean_fribidi
  fi
  fun_build_fribidi $2

  if [ $1 = true ]; then
    echo "build clean freetype"
  fun_build_clean_freetype
  fi
  fun_build_freetype_step1 $2

  if [ $1 = true ]; then
    echo "build clean fontconfig"
  fun_build_clean_fontconfig
  fi
  fun_build_fontconfig $2

  if [ $1 = true ]; then
    echo "build clean harfbuzz"
  fun_build_clean_harfbuzz
  fi
  fun_build_harfbuzz $2

  if [ $1 = true ]; then
    echo "build clean freetype"
  fun_build_clean_freetype
  fi
  fun_build_freetype_step2 $2

  if [ $1 = true ]; then
    echo "build clean libass"
  fun_build_clean_libass
  fi
  fun_build_libass $2

  if [ $1 = true ]; then
    echo "build clean lame"
  fun_build_clean_lame
  fi
  fun_build_lame $2

  if [ $1 = true ]; then
    echo "build clean ffmpeg"
  fun_build_clean_ffmpeg
  fi
  fun_build_ffmpeg $2
}

FLAG_CLEAN_SUB_PROJECT=false
for opt do
    optval="${opt#*=}"
    echo "opt=$opt"
    echo "optval=$optval"
    case "$opt" in
    --help|-h)
        show_help
    ;;
    clean)
        fun_build_clean
    ;;
    --enable-clean|--enable-clean=*)
        if [ "$optval" = "--enable-clean" ] || [ "$optval" = "true" ]; then
          FLAG_CLEAN_SUB_PROJECT=true
        else
          FLAG_CLEAN_SUB_PROJECT=false
        fi
    ;;
    --build=*)
        case "$optval" in
        armv7a)
            fun_build_android_libs $FLAG_CLEAN_SUB_PROJECT -armv7a
        ;;
        arm64)
            fun_build_android_libs $FLAG_CLEAN_SUB_PROJECT -arm64
        ;;
        x86)
            fun_build_android_libs $FLAG_CLEAN_SUB_PROJECT -x86
        ;;
        x86_64)
            fun_build_android_libs $FLAG_CLEAN_SUB_PROJECT -x86_64
        ;;
        esac
    ;;
    esac
done
exit 0

