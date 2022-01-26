*Device Checklist for Pocophone F1 (beryllium) on Droidian
This represents the state of the Droidian port when flashed according to the [guide](https://github.com/Unofficial-droidian-for-pocof1/droidian-beryllium-guide).
 
***Working
- Actors: Manual brightness
- Actors: Notification LED
- Actors: Torchlight
- Actors: Vibration
- Bluetooth: Driver loaded at startup
- Bluetooth: Enable/disable and flightmode works
- Bluetooth: Pairing with headset works, volume control ok
- Bluetooth: Persistent MAC address between reboots
- Camera: Ensure proper cameras are in use
- Camera: Flashlight
- Camera: Photo
- Camera: Switch between back and front camera
- Cellular: Carrier info, signal strength
- Cellular: Change audio routings (Speakerphone, Earphone)
- Cellular: Data connection
- Cellular: Enable/disable mobile data and flightmode works
- Cellular: Incoming, outgoing calls
- Cellular: SMS in, out
- Endurance: Battery lifetime > 24h from 100%
- Misc: Waydroid
- Misc: AppArmor patches applied to kernel
- Misc: Battery percentage
- Misc: Date and time are correct after reboot (go to flight mode before)
- Misc: Online charging (Green charging symbol, percentage increase in stats etc)
- Sensors: Automatic brightness
- Sensors: Rotation works in Phosh
- Sensors: Touchscreen registers input across whole surface
- Sound: Loudspeaker, volume control ok
- Sound: Microphone, recording works
- Sound: System sounds and effects plays correctly (Camera shutter, Screenshot taken, Notifications)
- USB: SSH access (`ssh droidian@10.15.19.82`)
- WiFi: Driver loaded at startup
- WiFi: Enable/disable and flightmode works
- WiFi: Hotspot can be configured, switched on and off, can serve data to clients
- WiFi: Persistent MAC address between reboots

***Working with additional steps
- Misc: Reset to factory defaults (can be done in recovery)

***Not working
- Camera: Video (creates an empty `.mkv` file and freezes; in Waydroid camera functions fully)
- Sensors: Fingerprint reader, register and use fingerprints (fingerprint sensor just wakes up screen)
- Misc: Shutdown / Reboot (phone hangs after both, long press Power button to turn on again)
- Misc: Offline charging (Power down, connect USB cable, device boots to Droidian)
- GPU: Hardware video decoding (no support yet)
- USB: ADB access
- USB: MTP access

***Not tested
- Cellular: Switch connection speed between 2G/3G/4G works for all SIMs
- Cellular: Switch preferred SIM for calling and SMS - only for devices that support it
- Cellular: Voice in calls
- Cellular: MMS in, out
- Cellular: PIN unlock
- Misc: logcat, dmesg & syslog do not spam errors and service restarts
- Misc: SD card detection and access
- Sensors: GPS
- Sensors: Proximity works during a phone call
- Sound: Earphones detected, volume control ok
- Endurance: No reboot needed for 1 week (let us know if you achieved this)
