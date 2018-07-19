# MKSHRC

## Description
This module edits a file in system/etc called mkshrc which works similar to 
.bashrc on a Linux machine.

## Instructions
• Flash, reboot, open a terminal and try it out.

## Requirements
• make sure your device has /system/etc/mkshrc if it does, you should be good 
to go.

## Sources and used/needed tools
 • [MKSH Documentation](https://www.mirbsd.org/mksh.htm)
 • [Module source](https://github.com/skittles9823/mkshrc)
 • [Unity](https://github.com/Zackptg5/Unity)


## Note
I'm not sure how compatible the bash binary will be. It works for me on my 
device, but it's built into my rom so just see for yourself if it works by 
typing "bash" on the command line and if you successfully switched to the 
bash shell then you have a successful installation!

### Changes;
 • ${USER:=$(getprop ro.product.device)}
Make sure the username is the device name as opposed to u0_086ba or something similar.
 • PATH=.:$PATH
'.' is the current directory so adding . to path allows files in the current directory 
to be executed without defining a filepath.

### Aliases
 • ls = ls -1 --color=auto --group-directories-first
-1 makes the list one verticle line,  --group-directories-first sorts the list with folders first.
 • vd = cd
We all know why this is needed.
 • sudo = su -c "$@"
self explanatory.
 • aflinger = sudo dumpsys media.audio_flinger
Get a dumpsys of media.audio_flinger, useful for trouble shooting audio issues.
 • dservice = sudo dumpsys media.dolby_memoryservice
Useful if you have Dolby Atmos.
 • killice = sudo killall dk.icepower.icesound
Only usefull if you have ICESound installed.
 • salias = . $ETC/.aliases
Source the alias file if you wish to add your own ones.

## Changelog
- v1.2.0
  • Add bash binary (set "/system/xbin/bash -" as your command line in your terminal app to use bash by default.
  • Add /sdcard/.bashrc and /sdcard/.aliases for simplified command line changes.

- v1.1.5
  • ls looks nice and is sorted better now.
  • add '.' to $PATH so the current directory can be executed in.

- v1.1.4
  • Add dservice alias (useful if you have Atmos)

- v1.1.3
  • Add killice alias (Primarily for myself)

- v1.1.2
  • Inital version