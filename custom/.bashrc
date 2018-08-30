export host=android
export user=$(getprop ro.product.device)
export PATH=$PATH:/sbin/.core/busybox:.

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

. <SDCARD>/.aliases

# establish colours for PS1
green="\e[1;32m"
cyan="\e[1;36m"
purple="\e[1;35m"
blank="\e[m\]"

# Sexy af PS1
export PS1="$green┌[\@]$cyan[$user@$host]$purple[\w]\n$green└─$blank $ "
