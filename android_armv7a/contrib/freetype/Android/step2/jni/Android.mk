LOCAL_PATH := $(call my-dir)



include $(CLEAR_VARS)  
LOCAL_MODULE := png 
LOCAL_SRC_FILES := prebuilt/$(TARGET_ARCH_ABI)/libpng16.so
include $(PREBUILT_SHARED_LIBRARY) 


#include $(CLEAR_VARS)  
#LOCAL_MODULE := harfbuzz 
#LOCAL_SRC_FILES := prebuilt/libharfbuzz.so
#include $(PREBUILT_SHARED_LIBRARY) 


include $(CLEAR_VARS)

LOCAL_C_INCLUDES += freetype-2.7.1/include \
png/libpng \
freetype-2.7.1/builds/unix \
freetype-2.7.1/src/base \
freetype-2.7.1/objs \
harfbuzz-1.4.2/src/hb-ucdn \
harfbuzz-1.4.2/src \
harfbuzz-1.4.2 \
#harfbuzz

LOCAL_CFLAGS += -DFT_CONFIG_OPTION_USE_PNG -DFT_CONFIG_CONFIG_H="<ftconfig.h>" -DFT_CONFIG_OPTION_SYSTEM_ZLIB \
 -DFT2_BUILD_LIBRARY -DFT_CONFIG_MODULES_H="<ftmodule.h>" -DFT_CONFIG_OPTION_USE_HARFBUZZ -DHAVE_CONFIG_H 


LOCAL_MODULE := freetype
LOCAL_SRC_FILES := freetype-2.7.1/src/base/ftsystem.c \
freetype-2.7.1/src/base/ftdebug.c \
freetype-2.7.1/src/base/ftinit.c \
freetype-2.7.1/src/base/ftbase.c \
freetype-2.7.1/src/base/ftbbox.c \
freetype-2.7.1/src/base/ftbdf.c \
freetype-2.7.1/src/base/ftbitmap.c \
freetype-2.7.1/src/base/ftcid.c \
freetype-2.7.1/src/base/ftfntfmt.c \
freetype-2.7.1/src/base/ftfstype.c \
freetype-2.7.1/src/base/ftgasp.c \
freetype-2.7.1/src/base/ftglyph.c \
freetype-2.7.1/src/base/ftgxval.c \
freetype-2.7.1/src/base/ftlcdfil.c \
freetype-2.7.1/src/base/ftmm.c \
freetype-2.7.1/src/base/ftotval.c \
freetype-2.7.1/src/base/ftpatent.c \
freetype-2.7.1/src/base/ftpfr.c \
freetype-2.7.1/src/base/ftstroke.c \
freetype-2.7.1/src/base/ftsynth.c \
freetype-2.7.1/src/base/fttype1.c \
freetype-2.7.1/src/base/ftwinfnt.c \
freetype-2.7.1/src/truetype/truetype.c \
freetype-2.7.1/src/type1/type1.c \
freetype-2.7.1/src/cff/cff.c \
freetype-2.7.1/src/cid/type1cid.c \
freetype-2.7.1/src/pfr/pfr.c \
freetype-2.7.1/src/type42/type42.c \
freetype-2.7.1/src/winfonts/winfnt.c \
freetype-2.7.1/src/pcf/pcf.c \
freetype-2.7.1/src/bdf/bdf.c \
freetype-2.7.1/src/sfnt/sfnt.c \
freetype-2.7.1/src/autofit/autofit.c \
freetype-2.7.1/src/pshinter/pshinter.c \
freetype-2.7.1/src/raster/raster.c \
freetype-2.7.1/src/smooth/smooth.c \
freetype-2.7.1/src/cache/ftcache.c \
freetype-2.7.1/src/gzip/ftgzip.c \
freetype-2.7.1/src/lzw/ftlzw.c \
freetype-2.7.1/src/bzip2/ftbzip2.c \
freetype-2.7.1/src/psaux/psaux.c \
freetype-2.7.1/src/psnames/psnames.c \
harfbuzz-1.4.2/src/hb-blob.cc \
harfbuzz-1.4.2/src/hb-buffer-serialize.cc \
harfbuzz-1.4.2/src/hb-buffer.cc \
harfbuzz-1.4.2/src/hb-common.cc \
harfbuzz-1.4.2/src/hb-face.cc \
harfbuzz-1.4.2/src/hb-font.cc \
harfbuzz-1.4.2/src/hb-ot-tag.cc \
harfbuzz-1.4.2/src/hb-set.cc \
harfbuzz-1.4.2/src/hb-shape.cc \
harfbuzz-1.4.2/src/hb-shape-plan.cc \
harfbuzz-1.4.2/src/hb-shaper.cc \
harfbuzz-1.4.2/src/hb-unicode.cc \
harfbuzz-1.4.2/src/hb-warning.cc \
harfbuzz-1.4.2/src/hb-ot-font.cc \
harfbuzz-1.4.2/src/hb-ot-layout.cc \
harfbuzz-1.4.2/src/hb-ot-map.cc \
harfbuzz-1.4.2/src/hb-ot-math.cc \
harfbuzz-1.4.2/src/hb-ot-shape.cc \
harfbuzz-1.4.2/src/hb-ot-shape-complex-arabic.cc \
harfbuzz-1.4.2/src/hb-ot-shape-complex-default.cc \
harfbuzz-1.4.2/src/hb-ot-shape-complex-hangul.cc \
harfbuzz-1.4.2/src/hb-ot-shape-complex-hebrew.cc \
harfbuzz-1.4.2/src/hb-ot-shape-complex-indic.cc \
harfbuzz-1.4.2/src/hb-ot-shape-complex-indic-table.cc \
harfbuzz-1.4.2/src/hb-ot-shape-complex-myanmar.cc \
harfbuzz-1.4.2/src/hb-ot-shape-complex-thai.cc \
harfbuzz-1.4.2/src/hb-ot-shape-complex-tibetan.cc \
harfbuzz-1.4.2/src/hb-ot-shape-complex-use.cc \
harfbuzz-1.4.2/src/hb-ot-shape-complex-use-table.cc \
harfbuzz-1.4.2/src/hb-ot-shape-normalize.cc \
harfbuzz-1.4.2/src/hb-ot-shape-fallback.cc \
harfbuzz-1.4.2/src/hb-ot-var.cc \
harfbuzz-1.4.2/src/hb-fallback-shape.cc \
harfbuzz-1.4.2/src/hb-ft.cc \
harfbuzz-1.4.2/src/hb-ucdn.cc \
harfbuzz-1.4.2/src/hb-ucdn/ucdn.c \

#LOCAL_STATIC_LIBRARIES := harfbuzz
LOCAL_SHARED_LIBRARIES := png
LOCAL_LDLIBS += -L$(SYSROOT)/usr/lib -llog -lz
include $(BUILD_SHARED_LIBRARY)

#ndk-build NDK_PROJECT_PATH=. APP_BUILD_SCRIPT=./Android.mk
