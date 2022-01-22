# Droidian for the Poco F1
A collection of tips to install and use Droidian on the Pocophone F1 (beryllium)

# Requirements
- A computer with fastboot and adb access to the phone
- A USB 2.0 port with actual USB 2.0 controller (if you don't have an old enough computer, a 2.0 USB hub works well)
- Unlocked bootloader
- Backup all your data, as your phone will be WIPED.

# Installation
## 1. Install Ubuntu Touch
- Flash Ubuntu Touch with the [official installer](https://devices.ubuntu-touch.io/device/beryllium/), see downloads at the bottom of the page
- Note: Your current recovery will be replaced by the Ubuntu Touch recovery.

## 2. Install TWRP 
- Download the [latest TWRP](https://dl.twrp.me/beryllium/)
- Boot to fastboot mode by pressing the Vol- and Power buttons until the phone vibrates
- Check that the phone is recognized by running `fastboot devices`
- Run `fastboot flash recovery twrp-*-beryllium.img`

## 3. Install Droidian in TWRP
- Download the files for Droidian:
    - Official `droidian-rootfs` and `droidian-devtools` for `arm64` from [the repo](https://github.com/droidian-images/rootfs-api28gsi-all/releases/tag/droidian%2Fbullseye%2F23) 
    - [Boot images](https://github.com/thomashastings/droidian-beryllium-guide/releases/download/Boot/droidian-boot-beryllium.zip)
- Boot into TWRP by pressing Vol+ and Power buttons until the phone vibrates
- In TWRP go to `Wipe` and `Format data` (type yes)
- IMPORTANT: Reboot into TWRP again

- The internal storage is now available over MTP from the PC.
- Copy the Droidian files to the internal storage of the phone
- In TWRP do the following:
- Install images: `boot.img` and `boot-path.img` to `Boot` partition
- Install zip files (archives): `droidian-rootfs-api28gsi_arm64_YYYYMMDD.zip` and `droidian-devtools_arm64_YYYYMMDD.zip`
- Go back to main menu and reboot to `System`
- (TWRP might complain that there is no OS installed, but that's fine)
- If all goes well, your phone will boot to the Droidian lock screen, the unlock code is `1234`

## 4. Tweaks
These tweaks can be run when connected to the phone over SSH or straight from the `King's Cross` terminal app.

### Bluetooth
`sudo touch /var/lib/bluetooth/board-address`

## Credit
TBD
