export user=android
export PATH=.:/sbin/.core/busybox:/sbin:/system/sbin:/system/bin:/system/xbin:/vendor/bin:/vendor/xbin
export host=$(getprop ro.product.device)

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

. /sdcard/.aliases

export PS1="\[\e[1;32m\]\@\[\e[m\]\[\e[1;31m\]:\[\e[m\]\[\e[1;31m\]\$user\[\e[m\]\[\e[1;33m\]@\[\e[m\]\[\e[1;33m\]\$host\[\e[m\]\[\e[1;36m\][\[\e[m\]\[\e[1;36m\]\w\[\e[m\]\[\e[1;36m\]]\[\e[m\]\[\e[1;36m\]\[\e[m\]\n~$ "
