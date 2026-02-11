#zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit load "zsh-users/zsh-syntax-highlighting"
zinit load "zsh-users/zsh-autosuggestions"
zinit load "zsh-users/zsh-completions"
zinit light Aloxaf/fzf-tab

# initialize Zsh's completion system
autoload -U compinit && compinit

# History
HISTSIZE=50000
HISTFILE=~/.zsh_history
SACEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_all_dups
setopt hist_find_no_dups

# completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-review 'ls --color $realpath'

#add $home/.local/bin, cargo, go, and Ruby to path
export PATH=$PATH:$HOME/.local/bin:/home/zyzyx/.cargo/bin:/home/zyzyx/.local/share/gem/ruby/3.2.0/bin
export PATH="$PATH:$HOME/.fzf/bin"
export PATH="$PATH:$HOME/.cargo/env"
export PATH="$PATH:$HOME/go/bin"

# Custom environment variables
export PASSWORD_STORE_DIR="/media/RIP/pass"

# for perl
LC_CTYPE=en_US.UTF-8
LC_ALL=en_US.UTF-8

# Custom aliases
alias ls="lsd"
alias ll="lsd -alF"
alias awaken="bash ~/.config/custScripts/awaken.sh"
alias peace="bash ~/.config/custScripts/peace.sh"
alias ghpush="bash ~/.config/custScripts/GHPush.sh"
alias fetch="fastfetch" #whatever version of fetch I am using right now
alias lz="lazygit"
alias vi="nvim"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

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
    *kali*)                  ICON="";;
    *linuxmint*)             ICON="";;
    *macos*)                 ICON="";;
    *mageia*)                ICON="";;
    *manjaro*)               ICON="";;
    *nixos*)                 ICON="";;
    *opensuse*|*tumbleweed*) ICON="";;
    *raspbian*)              ICON="";;
    *rhel*)                  ICON="";;
    *sabayon*)               ICON="";;
    *slackware*)             ICON="";;
    *ubuntu*)                ICON="";;
    *void*)                  ICON="";;
    *)                       ICON="";;
esac

export STARSHIP_DISTRO="$ICON"
export STARSHIP_DEVICE="$DEVICE"

eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"

# home
bindkey '\e[H' Beginning-of-line
bindkey '\eOH' Beginning-of-line

# End
bindkey '\e[F' end-of-line
bindkey '\eOF' end-of-line

# Run fetch
fetch

# Autoload ssh key based on host name
case "$HOST" in
  "Walker")
    ssh-add ~/.ssh/zyzyx@walker 2>/dev/null || true
    ;;
  # Add other entries if you install Void on other PCs
esac

# Stuff for sway to make ask-pass work
export SSH_ASKPASS='/usr/local/bin/yad-ssh-askpass'
export DISPLAY=:0  # Dummy value to trick SSH into using the graphical prompt

source <(fzf --zsh)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
