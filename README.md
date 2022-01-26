# Droidian for the Poco F1
A collection of tips to install and use Droidian on the Pocophone F1 (beryllium)

### Requirements
- A computer with fastboot and adb access to the phone
- A USB 2.0 port/hub with actual USB 2.0 controller (fastboot on USB 3.0 can be problematic with Poco F1)
- Unlocked bootloader
- Backup all your data, as **your phone will be WIPED**

## Installation
### 0. Download files
- Droidian: `droidian-rootfs` and `droidian-devtools` for `arm64` from [the Droidian repo](https://github.com/droidian-images/rootfs-api28gsi-all/releases/tag/droidian%2Fbullseye%2F23)
- Latest [boot image](https://github.com/Unofficial-droidian-for-pocof1/linux_android_xiaomi_beryllium/releases)
- Latest [adaptation zip](https://github.com/Unofficial-droidian-for-pocof1/android-recovery-beryllium-adaptation/releases)
- [Vendor image](https://github.com/ubports-beryllium/artifacts/releases/download/v3/vendor.img)
- Android 9 Pie [official firmware](https://xiaomifirmwareupdater.com/download/?file=fw_beryllium_miui_POCOF1Global_9.6.27_6673f8a455_9.0.zip)
- Latest [TWRP](https://dl.twrp.me/beryllium/)

### 1. Install TWRP 
- Boot to fastboot mode by pressing the Vol- and Power buttons until the phone vibrates
- Check that the phone is recognized by running `fastboot devices`
- Install TWRP by running `fastboot flash recovery twrp-*-beryllium.img`

### 2. Install Droidian in TWRP
TWRP:
- Boot into TWRP by pressing Vol+ and Power buttons until the phone vibrates
- Go to `Wipe` and `Format data` (type yes)
- IMPORTANT: **Reboot into TWRP again**

PC:
- Connect the phone via USB
- The internal storage is now available over MTP from the PC
- Copy the downloaded files to the internal storage of the phone

TWRP:
- Install image: `boot.img` to `Boot` partition
- Install image: `vendor.img` to `Vendor` partition
- Install zip file: `fw_beryllium_miui_POCOF1Global_9.6.27_6673f8a455_9.0.zip`
- Install zip file: `droidian-rootfs-api28gsi_arm64_YYYYMMDD.zip` 
- Install zip file: `droidian-devtools_arm64_YYYYMMDD.zip`
- Install zip file: `android-recovery-beryllium-adaptation.zip`
- Go back to main menu and reboot to `System` (TWRP might complain that there is no OS installed, but that's fine)
- The first boot may take longer, and at least one spontaneous reboot is expected during the process
- If all goes well, your phone will boot to the Droidian lock screen, the unlock code is `1234`
- Now open the `King's Cross` terminal app

    - run `fix-wifi.sh`
    
    - type in `1234`
    
    - `enter`
- Reboot the phone (long press power button)
- Installation is complete

## Tweaks
### Mobile data
Mobile data works after setting up your APN. It may stop working after a call, then you need to tap on/off twice in the settings and it should work again.

### Additional tweaks
For other tweaks, open the `King's Cross` terminal app, and run `beryllium-extras.sh`.
The following options are available:
- Notch fix (moves the clock from its original invisible position to the left side)
- Switching between dark mode and light mode (Adwaita theme)
- Automated installation of Waydroid

## Credit
[Joel Selvaraj](https://github.com/joelselvaraj)

[1petro](https://github.com/1petro)

[Droidian](http://droidian.org/)

[UBports](https://ubuntu-touch.io/)


For further assistance, visit the [Droidian for Poco F1](https://t.me/pocof1droidian) and [Droidian](https://t.me/droidianlinux) Telegram groups.
