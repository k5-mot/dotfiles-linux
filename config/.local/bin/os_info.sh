#!/bin/zsh

get_os_bit() {
  echo $(uname -m)
}

# Get Linux distribution name
get_os_distribution() {
  if   [ -e /etc/debian_version ] || [ -e /etc/debian_release ]; then
    # Check Ubuntu or Debian
    if [ -e /etc/lsb-release ]; then
      # Ubuntu
      distri_name="ubuntu"
      distri_fullname="Ubuntu"
      distri_icon="\ue73a"
    else
      # Debian
      distri_name="debian"
      distri_fullname="Debian"
      distri_icon="\ue77d"
    fi
  elif [ -e /etc/fedora-release ]; then
    # Fedora
    distri_name="fedora"
    distri_fullname="Fedora"
    distri_icon="\uf30a"
  elif [ -e /etc/redhat-release ]; then
    if [ -e /etc/oracle-release ]; then
      # Oracle Linux
      distri_name="oracle"
      distri_fullname="Oracle Linux"
      distri_icon="\ue712"
    else
      # Red Hat Enterprise Linux
      distri_name="redhat"
      distri_fullname="Red Hat Enterprise Linux"
      distri_icon="\ue7bb"
    fi
  elif [ -e /etc/arch-release ]; then
    # Arch Linux
    distri_name="arch"
    distri_fullname="Arch Linux"
    distri_icon="\uf303"
  elif [ -e /etc/turbolinux-release ]; then
    # Turbolinux
    distri_name="turbol"
    distri_fullname="Turbo Linux"
    distri_icon="\ue712"
  elif [ -e /etc/SuSE-release ]; then
    # SuSE Linux
    distri_name="suse"
    distri_fullname="SuSE Linux"
    distri_icon="\uf314"
  elif [ -e /etc/mandriva-release ]; then
    # Mandriva Linux
    distri_name="mandriva"
    distri_fullname="SuSE Linux"
    distri_icon="\uf311"
  elif [ -e /etc/vine-release ]; then
    # Vine Linux
    distri_name="vine"
    distri_fullname="SuSE Linux"
    distri_icon="\uf1ca"
  elif [ -e /etc/gentoo-release ]; then
    # Gentoo Linux
    distri_name="gentoo"
    distri_fullname="SuSE Linux"
    distri_icon="\uf30d"
  else
    # Other
    distri_name="unkown"
    distri_fullname="Unknown Linux"
    distri_icon="\ue712"
  fi

  echo "${distri_fullname} ${distri_icon}"
}


echo "Distribution: $(get_os_distribution)"
echo "OS bits     : $(get_os_bit)"
