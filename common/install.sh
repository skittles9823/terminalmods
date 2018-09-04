sed_files
if [ ! -f $SDCARD/.aliases ]; then
  ui_print "   Copying .aliases to $SDCARD"
  cp $INSTALLER/custom/.aliases $SDCARD
else
  ui_print "   $SDCARD/.aliases found! Skipping overwrite."
fi
ui_print " "
if [ -f /system/xbin/bash -o -f /system/bin/bash ]; then
  ui_print "   Bash binary found!"
  if [ ! -f $SDCARD/.bashrc ]; then
    ui_print "   Copying .bashrc to $SDCARD"
    cp $INSTALLER/custom/.bashrc $SDCARD
  else
    ui_print "   $SDCARD/.bashrc found! Skipping overwrite."
  fi
  mkdir -p $INSTALLER/system/etc/bash
  ui_print "   Copying bashrc to /system/etc/bash"
  cp $INSTALLER/custom/bash/bashrc $INSTALLER/system/etc/bash
else
  ui_print "   No bash binary found!"
  ui_print "   If you install bash at a later date,"
  ui_print "   please reflash this module."
fi
