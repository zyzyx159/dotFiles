# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

#add $home/.local/bin to path
export PATH=$PATH:$HOME/.local/bin

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode auto      # update automatically without asking

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  zsh-autocomplete
)

source $ZSH/oh-my-zsh.sh

#script for starship
# find out which distribution we are running on
LFILE="/etc/os-release"
MFILE="/System/Library/CoreServices/SystemVersion.plist"
if [[ -f $LFILE ]]; then
  _distro=$(awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }')
elif [[ -f $MFILE ]]; then
  _distro="macos"

  # on mac os use the systemprofiler to determine the current model
  _device=$(system_profiler SPHardwareDataType | awk '/Model Name/ {print $3,$4,$5,$6,$7}')

  case $_device in
    *MacBook*)     DEVICE="";;
    *mini*)        DEVICE="󰇄";;
    *)             DEVICE="";;
  esac
fi

# set an icon based on the distro
# make sure your font is compatible with https://github.com/lukas-w/font-logos
case $_distro in
    *alpine*)                ICON="";;
    *aosc*)                  ICON="";;
    *arch*)                  ICON="";;
    *centos*)                ICON="";;
    *coreos*)                ICON="";;
    *debian*)                ICON="";;
    *devuan*)                ICON="";;
    *elementary*)            ICON="";;
    *fedora*)                ICON="";;
    *gentoo*)                ICON="";;
    *kali*)                  ICON="ﴣ";;
    *linuxmint*)             ICON="";;
    *macos*)                 ICON="";;
    *mageia*)                ICON="";;
    *manjaro*)               ICON="";;
    *nixos*)                 ICON="";;
    *opensuse*|*tumbleweed*) ICON="";;
    *raspbian*)              ICON="";;
    *rhel*)                  ICON="";;
    *sabayon*)               ICON="";;
    *slackware*)             ICON="";;
    *ubuntu*)                ICON="";;
    *)                       ICON="";;
esac

export STARSHIP_DISTRO="$ICON"
export STARSHIP_DEVICE="$DEVICE"

eval "$(starship init zsh)"
