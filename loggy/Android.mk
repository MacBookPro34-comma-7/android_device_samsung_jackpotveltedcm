LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_RECOVERY_BUILD_LOGGY), true)
    include $(CLEAR_VARS)
    LOCAL_SRC_FILES := loggy.c
    LOCAL_C_INCLUDES := $(LOCAL_PATH) 
    LOCAL_CFLAGS := -pthread -lpthread
    LOCAL_SHARED_LIBRARIES := libc

    LOCAL_MODULE := loggy
    LOCAL_MODULE_TAGS := optional
    LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/sbin
    LOCAL_VENDOR_MODULE := true

    # change interpreter to /system/bin/linker64 -> /sbin/linker64
    LOCAL_POST_INSTALL_CMD := patchelf --set-interpreter /sbin/linker64 $(TARGET_RECOVERY_ROOT_OUT)/sbin/loggy
    include $(BUILD_EXECUTABLE)
endif

