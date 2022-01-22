# Droidian for the Poco F1
A collection of tips to install and use Droidian on the Pocophone F1 (beryllium)

# Requirements
- A computer with fastboot and adb access to the phone
- A USB 2.0 port/hub with actual USB 2.0 controller (fastboot on USB 3.0 can be problematic with Poco F1)
- Unlocked bootloader
- Backup all your data, as your phone will be WIPED

# Installation
## 0. Download files
- Droidian: `droidian-rootfs` and `droidian-devtools` for `arm64` from [the Droirian repo](https://github.com/droidian-images/rootfs-api28gsi-all/releases/tag/droidian%2Fbullseye%2F23)
- Latest boot image from [here](https://github.com/Unofficial-droidian-for-pocof1/linux_android_xiaomi_beryllium/releases)
- [Vendor image](https://github.com/ubports-beryllium/artifacts/releases/download/v3/vendor.img)
- Android 9 Pie [firmware](https://xiaomifirmwareupdater.com/download/?file=fw_beryllium_miui_POCOF1Global_9.6.27_6673f8a455_9.0.zip)

## 1. Install TWRP 
- Download the [latest TWRP](https://dl.twrp.me/beryllium/)
- Boot to fastboot mode by pressing the Vol- and Power buttons until the phone vibrates
- Check that the phone is recognized by running `fastboot devices`
- Run `fastboot flash recovery twrp-*-beryllium.img`

## 2. Install Droidian in TWRP
- Boot into TWRP by pressing Vol+ and Power buttons until the phone vibrates
- In TWRP go to `Wipe` and `Format data` (type yes)
- IMPORTANT: Reboot into TWRP again

- The internal storage is now available over MTP from the PC.
- Copy the Droidian files to the internal storage of the phone
- In TWRP do the following:
- Install zip file (archive): `fw_beryllium_miui_POCOF1Global_9.6.27_6673f8a455_9.0.zip`
- Install images: `boot.img` to `Boot` partition and `vendor.img` to `Vendor` partition
- Install zip files (archives): `droidian-rootfs-api28gsi_arm64_YYYYMMDD.zip` and `droidian-devtools_arm64_YYYYMMDD.zip`
- Go back to main menu and reboot to `System`
- (TWRP might complain that there is no OS installed, but that's fine)
- If all goes well, your phone will boot to the Droidian lock screen, the unlock code is `1234`

## Tweaks
These tweaks can be run when connected to the phone over SSH or straight from the `King's Cross` terminal app.

### Bluetooth
`sudo touch /var/lib/bluetooth/board-address`

## Credit
[Joel Selvaraj](https://github.com/joelselvaraj)
[1petro](https://github.com/1petro)
[Droidian](http://droidian.org/)
[UBports](https://ubuntu-touch.io/)
