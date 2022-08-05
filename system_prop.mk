PRODUCT_PROPERTY_OVERRIDES += \
    ro.arch=exynos7885 \
    ro.kernel.qemu=0 \
    ro.kernel.qemu.gles=1 \
    persist.demo.hdmirotationlock=false \
    dev.usbsetting.embedded=on \
    ro.opengles.version=196610 \
    debug.slsi_platform=1 \
    debug.hwc.winupdate=1 \
    debug.sf.disable_backpressure=1 \
    ro.hdcp2.rx=tz \
    sys.config.phone_start_early=true \
    ro.vendor.cscsupported=1 \
    vendor.rild.libargs=-d /dev/umts_ipc0 \
    keyguard.no_require_sim=true \
    ro.carrier=unknown \
    vendor.rild.libpath=/vendor/lib64/libsec-ril.so \
    vendor.sec.rild.libpath=/vendor/lib64/libsec-ril.so \
    ro.dalvik.vm.native.bridge=0 \
    security.ASKS.policy_version=000000 \
    security.mdf.result=None \
    security.mdf=None \
    ro.security.mdf.ux=Enabled \
    ro.security.mdf.ver=3.1 \
    ro.security.wlan.ver=1.0 \
    ro.security.wlan.release=2 \
    ro.security.mdf.release=4 \
    ro.security.fips.ux=Enabled \
    ro.security.fips_bssl.ver=1.3 \
    ro.security.fips_skc.ver=1.8 \
    ro.security.fips_scrypto.ver=2.0 \
    ro.security.fips_fmp.ver=1.2 \
    ro.sf.lcd_density=441 \
    ro.sf.init.lcd_density=480 \
    ro.build.scafe.version=2019A \
    ro.error.receiver.default=com.samsung.receiver.error \
    ro.hardware.keystore=mdfpp \
    ro.security.vpnpp.ver=2.1 \
    ro.security.vpnpp.release=2.0 \
    sys.config.activelaunch_enable=true \
    ro.frp.pst=/dev/block/persistent \
    persist.sys.tcpOptimizer.on=1 \
    ro.config.dha_cached_min=6 \
    ro.config.dha_cached_max=16 \
    ro.cfg.dha_cached_max=24 \
    ro.config.dha_empty_min=8 \
    ro.config.dha_empty_init=24 \
    ro.config.dha_empty_max=24 \
    ro.cfg.dha_empty_max=30 \
    ro.cfg.dha_empty_init=30 \
    ro.config.fha_enable=true \
    ro.config.systemaudiodebug=abox&codecdsp \
    ro.hardware.egl=mali \
    ro.config.vc_call_vol_steps=5 \
    debug.sf.latch_unsignaled=1 \
    qemu.hw.mainkeys=0 \
    persist.sys.strictmode.disable=true \
    dalvik.vm.dex2oat64.enabled=true

# Wifi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.direct.interface=p2p-dev-wlan0 \
    persist.debug.wfd.enable=1

# Configstore
PRODUCT_PROPERTY_OVERRIDES += \
    ro.surface_flinger.max_frame_buffer_acquired_buffers=3

# EFS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.multisim.simslotcount=1 \
    ro.vendor.multisim.simslotcount=1 \
    persist.radio.multisim.config=ss

# Tweaks
PRODUCT_PROPERTY_OVERRIDES += \
    gpu.fps=auto \
    cpu.fps=auto \
    boot.fps=60 \
    sys.use_fifo_ui=0 \
    ro.fps_enable=1 \
    debug.sf.hw=1 \
    ro.fps.capsmin=30fps \
    ro.fps.capsmax=60fps \
    persist.sys.dalvik.multithread=true \
    persist.sys.dalvik.hyperthreading=true

