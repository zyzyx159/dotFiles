#zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit load "zsh-users/zsh-autosuggestions"
zinit load "zsh-users/zsh-completions"
zinit load "marlonrichert/zsh-autocomplete"

#add $home/.local/bin to path
export PATH=$PATH:$HOME/.local/bin

# Custom environment variables
# pass_zx2c4
export PASSWORD_STORE_DIR="/media/RIP/pass"

# Custom aliases
alias ls="lsd"
alias ll="lsd -alF"
alias awaken="bash ~/git/dotFiles/scripts/awaken.sh"
alias peace="bash ~/git/dotFiles/scripts/peace.sh"

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
