# Terminal Modifications

## Description
This module edits the files `system/etc/mkshrc` and `system/etc/bash/bashrc`.
Which works the same as `.bashrc`/`.zshrc` on a Linux machine running bash or zsh respectively.

## Instructions
- Install the module from the Magisk Manager's Downloads section, then reboot.
- Navigate to /sdcard to find .aliases and .bashrc

## Requirements
- This module should be universal so if you have any issues don't hesitate to create an issue
on GitHub and I'll look into it ASAP.

## Sources and used/needed tools
 - [MKSH Documentation](https://www.mirbsd.org/mksh.htm)
 - [Module source](https://github.com/skittles9823/mkshrc)
 - [Unity](https://github.com/Zackptg5/Unity)

## Note
Some of the things here require the `bash` shell to be available on your device.
[osm0sis](https://github.com/osm0sis) provides a Magisk module in the official
repository with a constantly updated version that works on all devices, please
install it when installing this module for the best experience.

## Changes
 - ${USER:=$(getprop ro.product.device)}
Make sure the username is the device name as opposed to u0_086ba or something similar.
 - PATH=.:$PATH
'.' is the current directory so adding . to path allows files in the current directory 
to be executed without defining a filepath.

#### Aliases
- aflinger = `$ sudo dumpsys media.audio_flinger`
    - Get a dumpsys of media.audio_flinger, useful for trouble shooting audio issues.
- bsu      = `$ su -s bash`
    - Open a bash shell with superuser privelages.
- dservice = `$ sudo dumpsys media.dolby_memoryservice`
    - Grabs a system dump of Dolbys memory service.
- killice  = `$ sudo killall dk.icepower.icesound`
    - Usefull if you have ICESound installed to easily kill the service and test its processing.
- l        = `$ ls --group-directories-first`
    - Sorts with folders first.
- nano     = `$ nano -l`
    - Adds line numbers to the nano GUI.
- sbash    = `$ . system/etc/bash/bashrc`
    - Sources the bashrc file, useful if youve made changes to .aliases or .bashrc.
- sudo     = `$ su -c "$@"`
    - Executes commands as superuser.
- sysro    = `mount -o remount,ro /system'
    - Mounts system as read only
- sysrw    =`mount -o remount,rw /system'
    - Mounts system as read - write
- vd       = `$ cd`
    - Fat thumbs + small dpi = annoying ;_;

## Changelog

### v1.3.0
 - Remove $EXTERNAL_STORAGE var and replace with a dynamic $SDCARD var that get set with sed.
 - Remove bash binary.
 - Sort README.
 - New bash $PS1. It's sexy af.

### v1.2.0
 - Added bsu and sbash aliases.
 - Add bash binary (set "/system/xbin/bash -" as your command line in your terminal app to use bash by default.
 - Add $EXTERNAL_STORAGE/.bashrc and $EXTERNAL_STORAGE/.aliases for simplified command line changes.

### v1.1.5
 - l looks nice and is sorted better now.
 - Add '.' to $PATH so the current directory can be executed in.

### v1.1.4
 - Add dservice alias (useful if you have Atmos)

### v1.1.3
 - Add killice alias (Primarily for myself)

### v1.1.2
 - Inital version