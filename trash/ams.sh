#!/bin/bash

help() {
  echo "$0 [OPTIONS]"
  echo "  -h: help"
  echo "  -d: debug build"
  echo "  -c: copy aar to starmaker"
  echo "  -r: release build"
  echo "  -t: git merge to master and add tag"
  echo "  -p: publish library to maven"
  echo "  clean: clean project mediastreamlib"
  echo "  clean -all: clean project mediastreamlib and starmaker"
}

if [ "$1" = "-h" ]; then
  help
  exit
fi
targetOS=$(uname)
echo "${targetOS}"
if [ "${targetOS}" == "Darwin" ]; then
  if ! (command -v gsed >& /dev/null ) ; then echo "You need to install command gsed by \"brew install gnu-sed\". "; exit 1; fi
fi

scriptFilePath=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
#echo "${scriptFilePath}"

#cd "${scriptFilePath}/.." || exit
#echo "$(pwd)"

MEDIASTREAM_DIR="${scriptFilePath}/.."
#echo "${MEDIASTREAM_DIR}"
cd "${MEDIASTREAM_DIR}" || exit

STARMAKER_DIR="${MEDIASTREAM_DIR}/../starmaker-android-client"
#echo "${STARMAKER_DIR}"

if [ ! -d "${STARMAKER_DIR}" ]; then
  echo "No starmaker-android-client directory!"
  exit
fi

funExtractorAndCopyLibrary() {
  echo "Extractor file"
  cd "${MEDIASTREAM_DIR}/mediastreamlib" || exit
#  echo git status -u
  log=$(git status -u)
#  echo "$log"
#  while read -r line
#  do
#    echo ""
#  echo "$line"
#  done < "$log"

#  echo "$log"  | while read -r line
#  do
#    echo "${line}"
#    echo "1"
#    fileAAR="$(echo "${line}" | grep -e "\.aar")"
#
#    if [ "${fileAAR}" != "" ]; then
#      if [ "${targetOS}" == "Darwin" ]; then
#        fileAAR="$(echo "${fileAAR}" | gsed -e 's/^[ \t]*//g' | gsed -e 's/[ \t]*$//g')"
#      elif [ "${targetOS}" == "Linux" ]; then
#        fileAAR="$(echo "${fileAAR}" | sed -e 's/^[ \t]*//g' | sed -e 's/[ \t]*$//g')"
#      fi
#      echo "${fileAAR}"
#    fi

#  done


if [ ! -d "build/ams/tmp" ];then
  mkdir -p build/ams/tmp
else
  rm -rf build/ams/tmp/*
fi

IFS_OLD=$IFS        #默认的IFS的数值-->也是环境变量！
IFS=$'\n'           #自定义的IFS数值
  for line in ${log} ; do
    fileAAR=$(echo "${line}" | grep -e "\.aar")
    if [ "${fileAAR}" != "" ]; then
      if [ "${targetOS}" == "Darwin" ]; then
        fileAAR="$(echo "${fileAAR}" | gsed -e 's/^[ \t]*//g' | gsed -e 's/[ \t]*$//g')"
      elif [ "${targetOS}" == "Linux" ]; then
        fileAAR="$(echo "${fileAAR}" | sed -e 's/^[ \t]*//g' | sed -e 's/[ \t]*$//g')"
      fi
      echo "${fileAAR}"
      fileZip=${fileAAR//\.aar/\.zip}
      fileZip=${fileZip##*/}
      echo "$fileZip"
      cp "$fileAAR" "build/ams/tmp/$fileZip"
      unzipDir=${fileZip%.*}
      echo "build/ams/tmp/$unzipDir"
      unzip -d "build/ams/tmp/$unzipDir" "build/ams/tmp/$fileZip"
      if [ -d "build/ams/tmp/$unzipDir/jni/armeabi-v7a" ]; then
        echo "$unzipDir armeabi-v7a"
        cp build/ams/tmp/"$unzipDir"/jni/armeabi-v7a/*.so "src/main/libs/armeabi-v7a"
      fi
      if [ -d "build/ams/tmp/$unzipDir/jni/arm64-v8a" ]; then
        echo "$unzipDir arm64-v8a"
        cp build/ams/tmp/"$unzipDir"/jni/armeabi-v7a/*.so "src/main/libs/arm64-v8a"
      fi
    fi
  done
IFS=$IFS_OLD
#  mkir fileCache
  #检测更新的文件

}

if [ "$1" = "-e" ]; then
  funExtractorAndCopyLibrary
fi

funBuildRelease(){
  echo "build release mediastreamlib"
  cd "${MEDIASTREAM_DIR}" || exit
  if ! (./gradlew :mediastreamlib:assembleRelease); then echo "build release failed!"; exit 1; fi
  echo "build release finish"
}

funBuildDebug(){
  echo "build debug mediastreamlib"
  cd "${MEDIASTREAM_DIR}" || exit
  if ! (./gradlew :mediastreamlib:assembleDebug); then echo "build debug failed!"; exit 1; fi
  echo "build debug finish"
}

if [ "$1" = "clean" ]; then
  echo "Gradlew clean"
  cd "${MEDIASTREAM_DIR}" || exit
  ./gradlew clean
  rm -rf mediastreamlib/.cxx

  if [ "$2" = "-all" ]; then
    echo "Gradlew clean all"
    cd "${STARMAKER_DIR}" || exit
    ./gradlew clean
    rm -rf mediastreamlib/.cxx
  fi
fi

if [ "$1" = "-t" ] || [ "$2" = "-t" ] || [ "$3" = "-t" ] || [ "$4" = "-t" ]; then
  echo "git merge master and add tag"
  versionName=""
  properties="${MEDIASTREAM_DIR}/mediastreamlib/gradle.properties"
  echo "$properties"
  while read -r line
  do
  versionLine="$(echo "$line" | grep -e "^VERSION_NAME=" | grep -v "SNAPSHOT")"
  if [ "$versionLine" != "" ]; then
  echo "$versionLine"
  versionName="${versionLine#*VERSION_NAME=}"
  echo "$versionName"
  fi
  done < "$properties"

  if [ "$versionName" = "" ];then
    echo "versionName is NULL!"
    exit
  fi

  cd "${MEDIASTREAM_DIR}" || exit
  if ! (git checkout develop >& /dev/null); then echo "git checkout develop failed!"; exit 1; fi
  if ! (git pull --rebase origin >& /dev/null); then echo "git pull develop failed!"; exit 1; fi
  if ! (git symbolic-ref --short HEAD >& /dev/null); then echo "get branch name failed!"; exit 1; fi
  currentBranch=$(git symbolic-ref --short HEAD)
  echo "$currentBranch"
  if [ "$1" = "-r" ] || [ "$2" = "-r" ] || [ "$3" = "-r" ] || [ "$4" = "-r" ]; then
    funBuildRelease
  fi
  if ! (git checkout master >& /dev/null); then echo "git checkout master failed!"; exit 1; fi
  if ! (git merge "$currentBranch" >& /dev/null); then echo "merge $currentBranch failed!"; exit 1; fi

  git push origin
  git tag -a "$versionName" -m "$versionName"
  git push origin "$versionName"
fi

if [ "$1" = "-d" ] || [ "$2" = "-d" ] || [ "$3" = "-d" ] || [ "$4" = "-d" ]; then
  funBuildDebug
fi

if [ "$1" = "-r" ] || [ "$2" = "-r" ] || [ "$3" = "-r" ] || [ "$4" = "-r" ]; then
  if [ "$1" != "-t" ] && [ "$2" != "-t" ] && [ "$3" != "-t" ] && [ "$4" != "-t" ] ; then
    funBuildRelease
  fi
fi

if [ "$1" = "-c" ] || [ "$2" = "-c" ] || [ "$3" = "-c" ] || [ "$4" = "-c" ]; then
  echo "Copy mediastreamlib-debug.aar to starmaker"
  cd "${MEDIASTREAM_DIR}" || exit
  cp -f "mediastreamlib/build/outputs/aar/mediastreamlib-debug.aar" "${STARMAKER_DIR}/libraries/aars/mediastreamlib.aar"
fi

if [ "$1" = "-p" ] || [ "$2" = "-p" ] || [ "$3" = "-p" ] || [ "$4" = "-p" ]; then
  echo "push debug mediastreamlib"
  cd "${MEDIASTREAM_DIR}" || exit
  ./gradlew :mediastreamlib:publishMavenPublicationToMavenRepository
fi