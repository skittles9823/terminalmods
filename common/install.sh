sed_files
ui_print "   Copying .aliases to $SDCARD"
cp $INSTALLER/custom/.aliases $SDCARD
if [ -f /system/xbin/bash -o -f /system/bin/bash ]; then
  ui_print "   Bash binary found!"
  ui_print "   Copying .bashrc to $SDCARD"
  cp $INSTALLER/custom/.bashrc $SDCARD
  mkdir -p $INSTALLER/system/etc/bash
  ui_print "   Copying bashrc to /system/etc/bash"
  cp $INSTALLER/custom/bash/bashrc $INSTALLER/system/etc/bash
else
  ui_print "   Bash binary not found!"
  ui_print "   If you install bash at a later date,"
  ui_print "   please reflash this module."
fi