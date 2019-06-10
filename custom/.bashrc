# .bashrc by Skittles9823 2018 - 2019
#           Terminal Mods

export host=android
export HOME=/
export HOSTNAME=$(getprop ro.product.device)
export TERM=xterm
export TMPDIR=/data/local/tmp
export USER=$(id -un)
export BBDIR="/sbin/.magisk/busybox"
export PATH=/sbin:${BBDIR}:${PATH}:.

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

rootcheck(){
  ROOT= && [ $USER = root ] || ROOT="su -c"
}
cdn(){
  cmd=""
  for (( i=0; i < $1; i++)) do
    cmd="$cmd../"
  done
  cd "$cmd"
}
setpriority(){
  rootcheck
  case $2 in
      high) $ROOT cmd overlay set-priority $1 lowest
            $ROOT cmd overlay set-priority $1 highest;;
      low) $ROOT cmd overlay set-priority $1 highest
           $ROOT cmd overlay set-priority $1 lowest;;
      *) echo "Usage: setpriority overlay [option]"
         echo " "
         echo "Options:"
         echo " high - Sets the overlay to the highest priority"
         echo " low  - Sets the overlay to the lowest priority";;
    esac
}
adbfi(){
  rootcheck
  case $1 in
    on) $ROOT setprop service.adb.tcp.port 5555
        $ROOT stop adbd
        $ROOT start adbd
        echo "ADB over WiFi enabled";;
    off) $ROOT setprop service.adb.tcp.port -1
         $ROOT stop adbd
         $ROOT start adbd
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
overlays(){
  opt=$1
  rootcheck
  [ "$2" ] || opt=null
  case $opt in
    enable) shift
            for i in $($ROOT cmd overlay list | grep -iE "^\[.*$1" | sed 's|\[.* ||g'); do $ROOT cmd overlay enable $i; done;;
    disable) shift
             for i in $($ROOT cmd overlay list | grep -iE "^\[.*$1" | sed 's|\[.* ||g'); do $ROOT cmd overlay disable $i; done;;
    list) shift
          overlayList=$($ROOT cmd overlay list | grep -iE "^\[.*$1")
          echo "$overlayList";;
    *) echo "Usage: overlays [option] (keyword)"
       echo " "
       echo "Options:"
       echo " enable  - Enables all overlays that include the keyword in the packagename"
       echo " disable - Disables all overlays that include the keyword in the packagename"
       echo " list    - Lists all overlays that include the keyword in the packagename";;
  esac
}

. <SDCARD>/.aliases
. <SDCARD>/.customrc

# establish colours for PS1
green="\e[1;32m\]"
cyan="\e[1;36m\]"
purple="\e[1;35m\]"
blank="\e[m\]"

# Sexy af PS1
export PS1="${green}┌|\@${cyan} ${HOSTNAME} at ${host}${purple} in \W \n${green}└─${blank} \$ "
