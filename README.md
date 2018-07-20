# MKSHRC Modifications

## Description
This module edits a file in system/etc called mkshrc which works similar to 
.bashrc on a Linux machine.

## Instructions
• Flash, reboot, open a terminal and try it out.
• In a terminal window type `echo $EXTERNAL_STORAGE` to find .aliases and .bashrc

## Requirements
• Make sure your device has /system/etc/mkshrc if it does, you should be good 
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

#### Changes;
 • ${USER:=$(getprop ro.product.device)}
Make sure the username is the device name as opposed to u0_086ba or something similar.
 • PATH=.:$PATH
'.' is the current directory so adding . to path allows files in the current directory 
to be executed without defining a filepath.

#### Aliases
• aflinger = `$ sudo dumpsys media.audio_flinger`
- Get a dumpsys of media.audio_flinger, useful for trouble shooting audio issues.
• bsu      = `$ su -s bash`
- Open a bash shell with superuser privelages.
• dservice = `$ sudo dumpsys media.dolby_memoryservice`
- Grabs a system dump of Dolbys memory service.
• killice  = `$ sudo killall dk.icepower.icesound`
- Usefull if you have ICESound installed to easily kill the service and test its processing.
• l        = `$ ls -1 --group-directories-first`
- Lists vertically and sorts with folders first.
• nano     = `$ nano -l`
- Adds line numbers to the nano GUI.
• sbash    = `$ . system/etc/bash/bashrc`
- Sources the bashrc file, useful if youve made changes to .aliases or .bashrc.
• sudo     = `$ su -c "$@"`
- Executes commands as superuser.
• vd       = `$ cd`
- Fat thumbs + small dpi = annoying ;_;

## Changelog
v1.2.0
 • Added bsu and sbash aliases
 • Add bash binary (set "/system/xbin/bash -" as your command line in your terminal app to use bash by default.
 • Add $EXTERNAL_STORAGE/.bashrc and $EXTERNAL_STORAGE/.aliases for simplified command line changes.

v1.1.5
 • l looks nice and is sorted better now.
 • Add '.' to $PATH so the current directory can be executed in.

v1.1.4
 • Add dservice alias (useful if you have Atmos)

v1.1.3
 • Add killice alias (Primarily for myself)

v1.1.2
 • Inital version