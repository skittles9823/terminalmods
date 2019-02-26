if [ -d /sdcard ]; then
  SDCARD=/sdcard
elif [ -d /storage/emulated/0 ]; then
  SDCARD=/storage/emulated/0
fi
ui_print "   Setting $SDCARD location."
sed -i "s|<SDCARD>|$SDCARD|" $INSTALLER/custom/.bashrc
sed -i "s|<SDCARD>|$SDCARD|" $INSTALLER/custom/bash/bashrc
sed -i "s|<SDCARD>|$SDCARD|" $INSTALLER/system/etc/mkshrc
if [ ! -f $SDCARD/.aliases ]; then
  ui_print "   Copying .aliases to $SDCARD"
  cp $INSTALLER/custom/.aliases $SDCARD
else
  ui_print "   $SDCARD/.aliases found! Skipping overwrite."
fi
if [ ! -f $SDCARD/.bashrc ]; then
  ui_print "   Copying .bashrc to $SDCARD"
  cp $INSTALLER/custom/.bashrc $SDCARD
else
  ui_print "   $SDCARD/.bashrc found! Skipping overwrite."
fi
if [ -d /sbin/.magisk/img/bash ] || [ -f /system/bin/bash ]; then
  ui_print "   bash found! Skipping overwrite."
else
  mkdir -p $INSTALLER/system/xbin; mkdir -p $INSTALLER/system/etc/bash
  cp $INSTALLER/custom/bashbinary $INSTALLER/system/xbin/bash
  ui_print "   Copying bash to /system/xbin/"
  ui_print "   Copying bashrc to /system/etc/bash"
  cp $INSTALLER/custom/bash/bashrc $INSTALLER/system/etc/bash/bashrc
fi
