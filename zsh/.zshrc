autoload -Uz promptinit
promptinit
autoload -U colors
colors
autoload -U zsh/terminfo

# Need the global, autoupdated history, 
# since some tools I use (e.g. poetry)
# create lots of child sessions
setopt INC_APPEND_HISTORY  # do not wait for the shell to exit to append to the history
setopt SHARE_HISTORY       # in combination with the above allows accessing the history inside child sessions
setopt HIST_IGNORE_ALL_DUPS  

export DOTFILES=$HOME/.dotfiles

user_conf_dir=$DOTFILES/zsh/.config/zsh

# to add a function put it into $user_conf_dir/functions in <function-name> file
func_dir=$user_conf_dir/functions
fpath+=($func_dir)
export fpath
for _func in $func_dir/*; autoload ${_func:t}

# no need to start the new session in order to use updated aliases
precmd () { source $user_conf_dir/aliases }

# Shell config the tools
[[ -a $(which brew) ]] && eval "$(brew shellenv)"
[[ -a $(which starship) ]] && eval "$(starship init zsh)"
[[ -a $(which pyenv) ]] && eval "$(pyenv init -)" 

# as per the instructions - must run after everything else
hg=$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[[ -a $hg ]] && source $hg 

#export GOPATH="$HOME/go"
#export GOBIN="$HOME/go/bin"

# typeset -U PATH path
# path=(
#     "/usr/local/bin/"
#     "$(brew --prefix)/opt/openssl@3/bin"
#     "/Applications/WezTerm.app/Contents/MacOS"
#     "$(brew --prefix)/opt/libpq/bin"
#     "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
#     "$GOPATH"
#     "$GOBIN"
#     "$HOME/bin"
#     $HOME/.local/bin
#     "$path[@]"
# )
# export PATH
# 
# 
# 
# # enable pyenv
# eval "$(pyenv init --path)"
# eval "$(pyenv init -)"
# FZF_COMP=$HOME/.fzf.zsh
# [[ -f $FZF_COMP ]] && source $FZF_COMP
# 
# # CTRL-/ to toggle small preview window to see the full command
# # CTRL-Y to copy the command into clipboard using pbcopy
# export FZF_CTRL_R_OPTS="
#   --preview 'echo {}' --preview-window up:3:hidden:wrap
#   --bind 'ctrl-/:toggle-preview'
#   --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
#   --color header:italic
#   --header 'Press CTRL-Y to copy command into clipboard'"
# 
