# Droidian for the Poco F1
A collection of tips to install and use Droidian on the Pocophone F1 (beryllium)

### Requirements
- A computer with fastboot and adb access to the phone
- A USB 2.0 port/hub with actual USB 2.0 controller (fastboot on USB 3.0 can be problematic with Poco F1)
- Unlocked bootloader
- Backup all your data, as your phone will be WIPED

## Installation
### 0. Download files
- Droidian: `droidian-rootfs` and `droidian-devtools` for `arm64` from [the Droidian repo](https://github.com/droidian-images/rootfs-api28gsi-all/releases/tag/droidian%2Fbullseye%2F23)
- Latest [boot image](https://github.com/Unofficial-droidian-for-pocof1/linux_android_xiaomi_beryllium/releases)
- Other [boot image](https://github.com/thomashastings/droidian-beryllium-guide/releases/download/Boot/droidian-boot-beryllium.zip)
- [Vendor image](https://github.com/ubports-beryllium/artifacts/releases/download/v3/vendor.img)
- Android 9 Pie [official firmware](https://xiaomifirmwareupdater.com/download/?file=fw_beryllium_miui_POCOF1Global_9.6.27_6673f8a455_9.0.zip)

### 1. Install TWRP 
- Download the [latest TWRP](https://dl.twrp.me/beryllium/)
- Boot to fastboot mode by pressing the Vol- and Power buttons until the phone vibrates
- Check that the phone is recognized by running `fastboot devices`
- Run `fastboot flash recovery twrp-*-beryllium.img`

### 2. Install Droidian in TWRP
TWRP:
- Boot into TWRP by pressing Vol+ and Power buttons until the phone vibrates
- Go to `Wipe` and `Format data` (type yes)
- IMPORTANT: **Reboot into TWRP again**

PC:
- Connect the phone via USB
- The internal storage is now available over MTP from the PC
- Copy all of the downloaded files to the internal storage of the phone

TWRP:
- Install zip file (archive): `fw_beryllium_miui_POCOF1Global_9.6.27_6673f8a455_9.0.zip`
- Install images: `boot.img` to `Boot` partition and `vendor.img` to `Vendor` partition
- Install zip files (archives): `droidian-rootfs-api28gsi_arm64_YYYYMMDD.zip` and `droidian-devtools_arm64_YYYYMMDD.zip`
- Go back to main menu and reboot to `System`
- (TWRP might complain that there is no OS installed, but that's fine)
- If all goes well, your phone will boot to the Droidian lock screen, the unlock code is `1234`

## Tweaks
These device specific tweaks can be run when connected to the phone over SSH or straight from the `King's Cross` terminal app.

Furthermore, they are also available as a [runnable script](https://github.com/thomashastings/droidian-beryllium-guide/blob/main/beryllium-tweaks.sh).

For further Droidian tweaks (e. g., ringtones, mobile data, power saving), check [here](https://pad.mrcyjanek.net/p/r.901550d73e46cfeced7e4f12e969d120).

### Mobile data
Mobile data works after setting up the APN. It may stop working after a call, then you need to tap on/off twice in the settings and it will work again

### Bluetooth
`sudo touch /var/lib/bluetooth/board-address`

### Notch fix
This can be used to make the clock and the Power button visible. Open the config file:

 `nano ~/.config/gtk-3.0/gtk.css`
 
 And add the following lines:
```
.phosh-topbar-clock {
   margin-left: 195px;
}

.phosh-panel-btn > box {
   margin-left: 0px;
   margin-right: 0px;
}

.phosh-power-button {
   margin-right: 50px;
}
```

Reboot is needed for it to take effect.


### Waydroid
Be sure to connect to a wifi network at this point.

You can follow [this tutorial](https://docs.waydro.id/usage/install-on-desktops) to install Waydroid.

The installation will throw an error, but keep on going.

**Now reboot to TWRP and flash** `boot-path.img` **to** ``Boot`` **partition and reboot.**

Intialize Waydroid:
```
sudo apt install waydroid -y
sudo waydroid init
sudo waydroid container start
```

Reboot the phone. From now on, you should be able to run Waydroid from its icon.

When you successfully ran Waydroid for the first time, you can hide redundant apps from the Phosh app drawer [(source)](https://wiki.mobian-project.org/doku.php?id=waydroid&s[]=waydroid):

`for i in ~/.local/share/applications/waydroid*desktop; do echo 'NoDisplay=true' >> $i; done`

And stability may be improved by disabling suspend inside Waydroid [(source)](https://wiki.mobian-project.org/doku.php?id=waydroid&s[]=waydroid):
```
waydroid prop set persist.waydroid.no_suspend true
waydroid prop set persist.waydroid.suspend false
```


## Credit
[Joel Selvaraj](https://github.com/joelselvaraj)

[1petro](https://github.com/1petro)

[Droidian](http://droidian.org/)

[UBports](https://ubuntu-touch.io/)


For further assistance, visit the [Droidian for Poco F1](https://t.me/pocof1droidian) and [Droidian](https://t.me/droidianlinux) Telegram groups.
