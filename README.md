# Terminal Modifications

## Description
This module edits the files `system/etc/mkshrc` and `system/etc/bash/bashrc`.
Which works the same as `.bashrc`/`.zshrc` on a Linux machine running bash or zsh respectively.

## Instructions
- Install the module from the Magisk Manager's Downloads section, then reboot.
- Navigate to /sdcard to find .aliases and .bashrc

## Requirements
- This module should be universal so if you have any issues don't hesitate to create an issue on GitHub and I'll look into it ASAP.
- Magisk 18+

## Sources and used/needed tools
 - [MKSH Documentation](https://www.mirbsd.org/mksh.htm)
 - [Module source](https://github.com/skittles9823/mkshrc)
 - [Unity](https://github.com/Zackptg5/Unity)

## Note
To make full use of the .bashrc additions, install the bash module by Zackptg5

## Updating procedure
The module creates a backup of .bashrc .aliases every time it's flashed. If you've made custom changes simply them back over to the updated files.

## Changes
- ${USER:=$(getprop ro.product.device)}
 - Make sure the username is the device name as opposed to u0_086ba or something similar.
- PATH=$PATH:/sbin:/sbin/.magisk/busybox:.
 - '/sbin' contains various magisk binaries and more.
 - '/sbin/.magisk/busybox' contains magisks internal busybox.
 - '.' is the current directory so adding . to path allows files in the current directory to be executed without defining a filepath.

## Functions
- cdn [N]
 - cd back N number of dirs. 
 - e.g. `$ cdn 1` == `$ cd ../`
- setpriority [overlay] [high|low]
 - Change the priority of a specified overlay. 
 - e.g. `$ setpriority android.OutlineExtensions.EtherealColorPaletteLightPastelPurple high`
- adbfi [on|off|stats]
 - enable/disable adb over wifi with one command. 
 - e.g. `$ adbfi on`
- overlay [list|enable|disable] [arg]
 - find package names matching [arg] (case insensitive) then will [list|enable|disable] all matching overlays
 - e.g. `overlay list ethereal`

#### Aliases
- aflinger = `$ sudo dumpsys media.audio_flinger`
 - Get a dumpsys of media.audio_flinger, useful for trouble shooting audio issues.
- bb = `$ $BBPATH/busybox`
 - Calls magisks busybox if possible. Used to force specific versions of commands.
- bsu = `$ su -s bash`
 - Open a bash shell with superuser privelages.
- dservice = `$ sudo dumpsys media.dolby_memoryservice`
 - Grabs a system dump of Dolbys memory service.
- getperms = `$ pm get-privapp-permissions $1`
 - List all privileged permissions for a specified package.
- getdenyperms = `$ pm get-privapp-deny-permissions $1`
 - Lists all denied privelaged permissions for a specified package.
- killice = `$ sudo killall dk.icepower.icesound`
 - Usefull if you have ICESound installed to easily kill the service and test if it's processing.
- l = `$ ls --group-directories-first`
 - Sorts with folders first. Will use Magisks busybox for ls if detected. If not, will use default ls without the --group-directories-first parameter.
- nano = `$ nano -l`
 - Adds line numbers to the nano GUI.
- sbash = `$ . /system/etc/bash/bashrc`
 - Sources the bashrc file, useful if you've made changes to .aliases or .bashrc.
- sudo = `$ su -c "$@"`
 - Executes commands as superuser.
- sysro = `$ mount -o remount,ro /system`
 - Mounts system as read only
- sysrw =`$ mount -o remount,rw /system`
 - Mounts system as read - write
- vd = `$ cd`
 - Fat thumbs + small dpi = annoying ;_;

## Changelog
### v1.4.4
- hopefully fix the `$PS1` clipping issue
- oops, last update I forgot to rename `/sdcard` to `<SDCARD>`
- add `/sbin` back to `$PATH`
- change all uses of `sudo` in .aliases to `$ROOT`

### v1.4.3
- fix all broken aliases and functions (overlay function now works flawlessly)

### v1.4.2
 - add support for /sdcard/.customrc for any specific additions which will persist with updates
 - new template is Magisk only so let's remove the Magisk checks
 - add check to prepend `su -c` to commands when not running as root and without it when running as root

### v1.4.1
 - misc improvements and bug fixes

### v1.4.0
 - switch to updated magisk module template

### v1.3.9
 - remove bash from the module - just use Zackptg5s bash installer
 - Unity 3.3 update
 - better handling of updating .bashrc and .aliases

### v1.3.8
 - Unity 3.1 update
 - add setpriority and adbfi functions
 - add getperms and getdenyperms aliases (technically they're functions because reasons)
 - minMagisk to 1530 and make sure the old magisk path is able to be used
 - general improvements
 - update readme

### v1.3.7
 - update template to Unity 1.8.2
 - fix bug with the colours in the PS1 that caused issues with long commands
 - update mkshrc and .bashrc to reflect the path changes in Magisk 18
 - slight readme update

### v1.3.6
 - Unity 1.7.2 update

### v1.3.5
 - Add the bash binary again (compiled by @SphericalKat)

### v1.3.4
 - Update to Unity 1.7.1
 - Add /sbin to $PATH

### v1.3.3
 - Update for Unity 1.7 and magisk 17.
 - Fix sed_files function. (will now correctly sed system/etc/bash/bashrc to source /sdcard/.bashrc)
 - Only copy .aliases and .bashrc to /sdcard if they don't already exist.

### v1.3.2
 - Update to latest Unity template.

### v1.3.1
 - Small updates to the install. (Only installs bash files if bash is detected)

### v1.3.0
 - Remove $EXTERNAL_STORAGE var and replace with a dynamic $SDCARD var that gets set with sed.
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
