LOCAL_PATH := $(call my-dir)


define echo-path
$(shell echo $(LOCAL_PATH))
endef
ECHO_PATH = $(call echo-path)
$(warning $(ECHO_PATH))



include $(CLEAR_VARS)
#LOCAL_THIRD_LDLIBS_PATH = 
LOCAL_MODULE := x265
#LOCAL_C_INCLUDES := src/third_party_libs/include
LOCAL_SRC_FILES := libx265.a
include $(PREBUILT_STATIC_LIBRARY)


include $(CLEAR_VARS)
LOCAL_MODULE := h265decoder
LOCAL_SRC_FILES := AndroidH265Decoder.cpp
LOCAL_LDLIBS += -Wl,--no-warn-shared-textrel
LOCAL_C_INCLUDES += src/third_party_libs/include \
        ${ANDROID_NDK}/sources/cxx-stl/gnu-libstdc++/4.9/include \
        ${ANDROID_NDK}/sources/cxx-stl/gnu-libstdc++/4.9/libs/armeabi-v7a/include

LOCAL_STATIC_LIBRARIES := x265
LOCAL_LDLIBS += -lm -lz -lc -llog

include $(BUILD_SHARED_LIBRARY)
