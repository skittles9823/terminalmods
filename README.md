# MKSHRC

## Description
This module edits a file in system/etc called mkshrc which works similar to .bashrc on a Linux machine.

Ive made a few changes from my roms default one;

##### Makes the username the device name
- ${USER:=$(getprop ro.product.device)}

### A seperate .aliases file for a few custom aliases of which more will likely be added
- vd = cd
- sudo = su -c "$@"
- aflinger = sudo dumpsys media.audio_flinger
- salias = . $ETC/.aliases ($ETC is /system/etc)

## Note
I'm unsure how compatible this module will be, I've tested this module on a Nexus5X.
I'm sure different devices will have a different stock mkshrcs so if you have issues with this module let me know what they are and send a copy of your stock mkshrc.

## Changelog
v1.1.2
- Inital version

## Requirements
- make sure your device has /system/etc/mkshrc if it does, you should be good to go.

## Instructions
- Flash, reboot, open a terminal and try it out.

## Links
[MKSH Documentation](https://www.mirbsd.org/mksh.htm)

Pull requests are welcome.
[Module Github](https://github.com/skittles9823/mkshrc)
