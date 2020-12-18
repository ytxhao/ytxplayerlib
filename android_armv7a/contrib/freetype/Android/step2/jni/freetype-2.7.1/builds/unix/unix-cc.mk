#
# FreeType 2 template for Unix-specific compiler definitions
#

# Copyright 1996-2016 by
# David Turner, Robert Wilhelm, and Werner Lemberg.
#
# This file is part of the FreeType project, and may only be used, modified,
# and distributed under the terms of the FreeType project license,
# LICENSE.TXT.  By continuing to use, modify, or distribute this file you
# indicate that you have read the license and understand and accept it
# fully.


CC           := /home/yuhao/android/ndk/android-ndk-r11b/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin/arm-linux-androideabi-gcc --sysroot=/home/yuhao/android/ndk/android-ndk-r11b/platforms/android-19/arch-arm
COMPILER_SEP := $(SEP)
FT_LIBTOOL_DIR ?= $(BUILD_DIR)

LIBTOOL := $(FT_LIBTOOL_DIR)/libtool


# The object file extension (for standard and static libraries).  This can be
# .o, .tco, .obj, etc., depending on the platform.
#
O  := lo
SO := o


# The executable file extension.  Although most Unix platforms use no
# extension, we copy the extension detected by autoconf.  Useful for cross
# building on Unix systems for non-Unix systems.
#
E := 


# The library file extension (for standard and static libraries).  This can
# be .a, .lib, etc., depending on the platform.
#
A  := la
SA := a


# The name of the final library file.  Note that the DOS-specific Makefile
# uses a shorter (8.3) name.
#
LIBRARY := lib$(PROJECT)


# Path inclusion flag.  Some compilers use a different flag than `-I' to
# specify an additional include path.  Examples are `/i=' or `-J'.
#
I := -I


# C flag used to define a macro before the compilation of a given source
# object.  Usually it is `-D' like in `-DDEBUG'.
#
D := -D


# The link flag used to specify a given library file on link.  Note that
# this is only used to compile the demo programs, not the library itself.
#
L := -l


# Target flag.
#
T := -o$(space)


# C flags
#
#   These should concern: debug output, optimization & warnings.
#
#   Use the ANSIFLAGS variable to define the compiler flags used to enfore
#   ANSI compliance.
#
#   We use our own FreeType configuration file.
#
CPPFLAGS := -fpic -DANDROID -ffunction-sections -msoft-float -lm
CFLAGS   := -c -Wall -g -O2  -DFT_CONFIG_OPTION_SYSTEM_ZLIB -I/home/yuhao/ytxPlayer/android/contrib/jni/jniLibs/include/libpng -DFT_CONFIG_OPTION_USE_PNG -I/home/yuhao/ytxPlayer/android/contrib/jni/jniLibs/include/harfbuzz -DFT_CONFIG_OPTION_USE_HARFBUZZ -DFT_CONFIG_CONFIG_H="<ftconfig.h>"

# ANSIFLAGS: Put there the flags used to make your compiler ANSI-compliant.
#
ANSIFLAGS :=  -pedantic -ansi

# C compiler to use -- we use libtool!
#
#
CCraw := $(CC)
CC    := $(LIBTOOL) --mode=compile $(CCraw)

# Linker flags.
#
LDFLAGS := -L/home/yuhao/ytxPlayer/android/contrib/jni/jniLibs/lib -lz -L/home/yuhao/ytxPlayer/android/contrib/jni/jniLibs/lib -lpng -L/home/yuhao/ytxPlayer/android/contrib/jni/jniLibs/lib -lharfbuzz


# export symbols
#
CCraw_build  := gcc	# native CC of building system
E_BUILD      := 	# extension for exexutable on building system
EXPORTS_LIST := $(OBJ_DIR)/ftexport.sym
CCexe        := $(CCraw_build)	# used to compile `apinames' only


# Library linking
#
LINK_LIBRARY = $(LIBTOOL) --mode=link $(CCraw) -o $@ $(OBJECTS_LIST) \
                          -rpath $(libdir) -avoid-version \
                          $(LDFLAGS) -no-undefined \
                          -export-symbols $(EXPORTS_LIST)

# EOF