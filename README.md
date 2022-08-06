Samsung Galaxy A8 (2018) (SC-02L, SM-A530D) Device Tree.

---
Copyright (C) 2022 The LineageOS Project

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0.

---

`roomservice.xml`
```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <project name="MacBookPro34-comma-7/android_device_samsung_jackpotveltedcm" path="device/samsung/jackpotveltedcm" remote="github" revision="lineage-18.1" />
  <project name="MacBookPro34-comma-7/android_device_samsung_universal7885-common" path="device/samsung/universal7885-common" remote="github" revision="lineage-18.1" />
  <project name="MacBookPro34-comma-7/android_vendor_samsung_universal7885" path="vendor/samsung/universal7885" remote="github" revision="lineage-18.1" />
  <project name="MacBookPro34-comma-7/android_kernel_samsung_universal7885" path="kernel/samsung/universal7885" remote="github" revision="lineage-18.1" />
  <project path="hardware/samsung" remote="github" name="LineageOS/android_hardware_samsung" />
  <project path="hardware/samsung/nfc" remote="github" name="LineageOS/android_hardware_samsung_nfc" revision="lineage-18.1" />
  <project path="hardware/samsung_slsi/scsc_wifibt/wifi_hal" remote="github" name="LineageOS/android_hardware_samsung_slsi_scsc_wifibt_wifi_hal" />
  <project path="hardware/samsung_slsi/scsc_wifibt/wpa_supplicant_lib" remote="github" name="LineageOS/android_hardware_samsung_slsi_scsc_wifibt_wpa_supplicant_lib" />
</manifest>
```

`external/tinycompress/Android.bp`
```diff
@@ -18,7 +18,7 @@ cc_library_shared {
         "libutils",
     ],
     header_libs: [
-        "generated_kernel_headers",
+        "device_kernel_headers",
     ],
     product_variables: {
         lineage: {
```

