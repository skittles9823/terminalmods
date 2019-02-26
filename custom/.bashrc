export host=android
export HOME=/
export HOSTNAME=$(getprop ro.product.device)
export TERM=xterm
export TMPDIR=/data/local/tmp
export USER=$(id -un)

if [ -d "/sbin/.magisk/busybox" ]; then
  BBDIR=":/sbin/.magisk/busybox"
elif [ -d "/sbin/.core/busybox" ]; then
  BBDIR=":/sbin/.core/busybox"
fi
PATH=$PATH:/sbin:.$BBDIR

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

# Expand the history size
HISTFILESIZE=10000
HISTSIZE=100
# ... and ignore same sucessive entries.
HISTCONTROL=ignoreboth

cdn() {
  cmd=""
  for (( i=0; i < $1; i++)) do
    cmd="$cmd../"
  done
  cd "$cmd"
}
setpriority() {
case $2 in
    high) su -c cmd overlay set-priority $1 lowest
          su -c cmd overlay set-priority $1 highest;;
    low) su -c cmd overlay set-priority $1 highest
         su -c cmd overlay set-priority $1 lowest;;
    *) echo "Usage: setpriority overlay [option]"
       echo " "
       echo "Options:"
       echo " high - Sets the overlay to the highest priority"
       echo " low  - Sets the overlay to the lowest priority";;
  esac
}
adbfi() {
  case $1 in
    on) setprop service.adb.tcp.port 5555
        su -c stop adbd
        su -c start adbd
        echo "ADB over WiFi enabled";;
    off) setprop service.adb.tcp.port -1
         su -c stop adbd
         su -c start adbd
         echo "ADB over WiFi disabled";;
    stats) case `getprop service.adb.tcp.port` in -1) echo "off";; 5555) echo "on";; *) echo "off";; esac;;
    *) echo "Usage: adbfi [option]"
       echo " "
       echo "Options:"
       echo " on    - Enables ADB over Wifi"
       echo " off   - Disables ADB over WiFi"
       echo " stats - Gets current status";;
  esac
}

. <SDCARD>/.aliases

# establish colours for PS1
green="\e[1;32m\]"
cyan="\e[1;36m\]"
purple="\e[1;35m\]"
blank="\e[m\]"

# Sexy af PS1
export PS1="$green┌[\@]$cyan[$HOSTNAME@$host]$purple[\w]\n$green└─$blank $ "
