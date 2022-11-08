autoload -Uz promptinit
promptinit
autoload -U colors
colors
autoload -U zsh/terminfo
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true  # may potentially be slow (depending on the repo size)
zstyle ':vcs_info:git:*' formats '%c %u %F{8}%b%f'
zstyle ':vcs_info:git:*' stagedstr $'%F{116}\Ue0a0%f'
zstyle ':vcs_info:git:*' unstagedstr $'%F{166}\Ue0a0%f'
zstyle ':vcs_info:git:*' actionformats '%c%u%F{207}%a%f%F{8}%b%f'

# The following lines were added by compinstall
zstyle :compinstall filename $ZDOTDIR/.zshrc

autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)
# End of lines added by compinstall

#aliases
# alias ll='ls -GFlah'
alias ll='exa -laag --group-directories-first'
alias myip='curl ifconfig.co/ip'
alias v='nvim'

setopt PROMPT_SUBST

# share history among all zsh sessions, ignoring duplicates
setopt append_history share_history histignorealldups

precmd () { vcs_info }

# PS1=$'%F{105}[%f%F{12}%2~%f%F{105}]%f %F{red}\U2771%f%F{yellow}\U2771%f%F{green}\U2771%f '
PS1=$'%B%F{105}[%f%F{12}%~%f%F{105}]%f %F{red}\U2771%f%F{yellow}\U2771%f%F{green}\U2771%f%b '
RPS1='%B${vcs_info_msg_0_}%b'


function push_to_branch {
    curr_branch=$(git branch --show-current)
    if [  ${curr_branch} = "master" ]; then
        exit 1
    else
        git push origin ${curr_branch}
    fi
}

export GOPATH="$HOME/go"
export GOBIN="$HOME/go/bin"


typeset -U PATH path
path=(
    "$(brew --prefix)/opt/openssl@3/bin"
    "$(brew --prefix)/opt/libpq/bin"
    "$HOME/Library/Python/3.9/bin"
    "/Library/Frameworks/Python.framework/Versions/3.9/bin"
    "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
    "/Applications/WezTerm.app/Contents/MacOS"
    "$GOPATH"
    "$GOBIN"
    "$HOME/bin"
    "$HOME/.poetry/bin"
    "$path[@]"
)
export PATH

# enable zsh syntax highlighting
# run `brew install zsh-syntax-highlighting` first
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
