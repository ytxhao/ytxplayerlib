# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/source

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux

# Include any dependencies generated for this target.
include CMakeFiles/x265-static.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/x265-static.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/x265-static.dir/flags.make

# Object files for target x265-static
x265__static_OBJECTS =

# External object files for target x265-static
x265__static_EXTERNAL_OBJECTS = \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/encoder/CMakeFiles/encoder.dir/analysis.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/encoder/CMakeFiles/encoder.dir/search.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/encoder/CMakeFiles/encoder.dir/bitcost.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/encoder/CMakeFiles/encoder.dir/motion.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/encoder/CMakeFiles/encoder.dir/slicetype.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/encoder/CMakeFiles/encoder.dir/frameencoder.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/encoder/CMakeFiles/encoder.dir/framefilter.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/encoder/CMakeFiles/encoder.dir/level.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/encoder/CMakeFiles/encoder.dir/nal.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/encoder/CMakeFiles/encoder.dir/sei.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/encoder/CMakeFiles/encoder.dir/sao.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/encoder/CMakeFiles/encoder.dir/entropy.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/encoder/CMakeFiles/encoder.dir/dpb.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/encoder/CMakeFiles/encoder.dir/ratecontrol.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/encoder/CMakeFiles/encoder.dir/reference.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/encoder/CMakeFiles/encoder.dir/encoder.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/encoder/CMakeFiles/encoder.dir/api.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/encoder/CMakeFiles/encoder.dir/weightPrediction.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/encoder/CMakeFiles/encoder.dir/__/x265-extras.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/common/CMakeFiles/common.dir/primitives.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/common/CMakeFiles/common.dir/pixel.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/common/CMakeFiles/common.dir/dct.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/common/CMakeFiles/common.dir/ipfilter.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/common/CMakeFiles/common.dir/intrapred.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/common/CMakeFiles/common.dir/loopfilter.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/common/CMakeFiles/common.dir/constants.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/common/CMakeFiles/common.dir/cpu.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/common/CMakeFiles/common.dir/version.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/common/CMakeFiles/common.dir/threading.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/common/CMakeFiles/common.dir/threadpool.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/common/CMakeFiles/common.dir/wavefront.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/common/CMakeFiles/common.dir/md5.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/common/CMakeFiles/common.dir/bitstream.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/common/CMakeFiles/common.dir/yuv.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/common/CMakeFiles/common.dir/shortyuv.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/common/CMakeFiles/common.dir/picyuv.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/common/CMakeFiles/common.dir/common.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/common/CMakeFiles/common.dir/param.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/common/CMakeFiles/common.dir/frame.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/common/CMakeFiles/common.dir/framedata.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/common/CMakeFiles/common.dir/cudata.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/common/CMakeFiles/common.dir/slice.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/common/CMakeFiles/common.dir/lowres.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/common/CMakeFiles/common.dir/piclist.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/common/CMakeFiles/common.dir/predict.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/common/CMakeFiles/common.dir/scalinglist.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/common/CMakeFiles/common.dir/quant.cpp.o" \
"/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/common/CMakeFiles/common.dir/deblock.cpp.o"

libx265.a: encoder/CMakeFiles/encoder.dir/analysis.cpp.o
libx265.a: encoder/CMakeFiles/encoder.dir/search.cpp.o
libx265.a: encoder/CMakeFiles/encoder.dir/bitcost.cpp.o
libx265.a: encoder/CMakeFiles/encoder.dir/motion.cpp.o
libx265.a: encoder/CMakeFiles/encoder.dir/slicetype.cpp.o
libx265.a: encoder/CMakeFiles/encoder.dir/frameencoder.cpp.o
libx265.a: encoder/CMakeFiles/encoder.dir/framefilter.cpp.o
libx265.a: encoder/CMakeFiles/encoder.dir/level.cpp.o
libx265.a: encoder/CMakeFiles/encoder.dir/nal.cpp.o
libx265.a: encoder/CMakeFiles/encoder.dir/sei.cpp.o
libx265.a: encoder/CMakeFiles/encoder.dir/sao.cpp.o
libx265.a: encoder/CMakeFiles/encoder.dir/entropy.cpp.o
libx265.a: encoder/CMakeFiles/encoder.dir/dpb.cpp.o
libx265.a: encoder/CMakeFiles/encoder.dir/ratecontrol.cpp.o
libx265.a: encoder/CMakeFiles/encoder.dir/reference.cpp.o
libx265.a: encoder/CMakeFiles/encoder.dir/encoder.cpp.o
libx265.a: encoder/CMakeFiles/encoder.dir/api.cpp.o
libx265.a: encoder/CMakeFiles/encoder.dir/weightPrediction.cpp.o
libx265.a: encoder/CMakeFiles/encoder.dir/__/x265-extras.cpp.o
libx265.a: common/CMakeFiles/common.dir/primitives.cpp.o
libx265.a: common/CMakeFiles/common.dir/pixel.cpp.o
libx265.a: common/CMakeFiles/common.dir/dct.cpp.o
libx265.a: common/CMakeFiles/common.dir/ipfilter.cpp.o
libx265.a: common/CMakeFiles/common.dir/intrapred.cpp.o
libx265.a: common/CMakeFiles/common.dir/loopfilter.cpp.o
libx265.a: common/CMakeFiles/common.dir/constants.cpp.o
libx265.a: common/CMakeFiles/common.dir/cpu.cpp.o
libx265.a: common/CMakeFiles/common.dir/version.cpp.o
libx265.a: common/CMakeFiles/common.dir/threading.cpp.o
libx265.a: common/CMakeFiles/common.dir/threadpool.cpp.o
libx265.a: common/CMakeFiles/common.dir/wavefront.cpp.o
libx265.a: common/CMakeFiles/common.dir/md5.cpp.o
libx265.a: common/CMakeFiles/common.dir/bitstream.cpp.o
libx265.a: common/CMakeFiles/common.dir/yuv.cpp.o
libx265.a: common/CMakeFiles/common.dir/shortyuv.cpp.o
libx265.a: common/CMakeFiles/common.dir/picyuv.cpp.o
libx265.a: common/CMakeFiles/common.dir/common.cpp.o
libx265.a: common/CMakeFiles/common.dir/param.cpp.o
libx265.a: common/CMakeFiles/common.dir/frame.cpp.o
libx265.a: common/CMakeFiles/common.dir/framedata.cpp.o
libx265.a: common/CMakeFiles/common.dir/cudata.cpp.o
libx265.a: common/CMakeFiles/common.dir/slice.cpp.o
libx265.a: common/CMakeFiles/common.dir/lowres.cpp.o
libx265.a: common/CMakeFiles/common.dir/piclist.cpp.o
libx265.a: common/CMakeFiles/common.dir/predict.cpp.o
libx265.a: common/CMakeFiles/common.dir/scalinglist.cpp.o
libx265.a: common/CMakeFiles/common.dir/quant.cpp.o
libx265.a: common/CMakeFiles/common.dir/deblock.cpp.o
libx265.a: CMakeFiles/x265-static.dir/build.make
libx265.a: CMakeFiles/x265-static.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Linking CXX static library libx265.a"
	$(CMAKE_COMMAND) -P CMakeFiles/x265-static.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/x265-static.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/x265-static.dir/build: libx265.a

.PHONY : CMakeFiles/x265-static.dir/build

CMakeFiles/x265-static.dir/requires:

.PHONY : CMakeFiles/x265-static.dir/requires

CMakeFiles/x265-static.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/x265-static.dir/cmake_clean.cmake
.PHONY : CMakeFiles/x265-static.dir/clean

CMakeFiles/x265-static.dir/depend:
	cd /home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/source /home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/source /home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux /home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux /home/yuhao/ytxPlayer/android/contrib/libx265/x265_2.5/build/arm-linux/CMakeFiles/x265-static.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/x265-static.dir/depend

