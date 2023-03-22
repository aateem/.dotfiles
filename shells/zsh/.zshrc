autoload -Uz promptinit
promptinit
autoload -U colors
colors
autoload -U zsh/terminfo

# The following lines were added by compinstall
zstyle :compinstall filename $ZDOTDIR/.zshrc

autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)
# End of lines added by compinstall

setopt INC_APPEND_HISTORY SHARE_HISTORY HIST_IGNORE_ALL_DUPS

export GOPATH="$HOME/go"
export GOBIN="$HOME/go/bin"

typeset -U PATH path
path=(
    "$(brew --prefix)/opt/openssl@3/bin"
    "$(brew --prefix)/opt/libpq/bin"
    "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
    "$GOPATH"
    "$GOBIN"
    "$HOME/bin"
    $HOME/.local/bin
    "$path[@]"
)
export PATH

# enable zsh syntax highlighting
# run `brew install zsh-syntax-highlighting` first
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(starship init zsh)"

export DOTFILESDIR="$HOME/.dotfiles"
source $ZDOTDIR/custom_functions

FZF_COMP=$HOME/.fzf.zsh
[[ -f $FZF_COMP ]] && source $FZF_COMP

# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

precmd () { source $ZDOTDIR/aliases }
