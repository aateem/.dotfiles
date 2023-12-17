autoload -Uz promptinit && promptinit
autoload -U colors && colors
autoload -U zsh/terminfo

zmodload -i zsh/complist  # example use - handle list colors for the completion
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ''  # empty string used the default colors, better than nothing
zstyle ":completion:*" last-prompt true 
autoload -U compinit && compinit 

#################### Shell Opts
# Need the global, autoupdated history, 
# since some tools I use (e.g. poetry)
# create lots of child sessions
setopt INC_APPEND_HISTORY  # do not wait for the shell to exit to append to the history
setopt SHARE_HISTORY       # in combination with the above allows accessing the history inside child sessions
setopt HIST_IGNORE_ALL_DUPS  
setopt HIST_REDUCE_BLANKS
setopt LOCAL_OPTIONS  # reverts the options set inside a function
setopt GLOBDOTS  # globbin' over hidden files also enables the completion

#################### Shell params
HISTFILE=~/.cache/zsh/history
HISTSIZE=10000  # number of lines read at a session's start
SAVEHIST=10000  # number of lines saved at the sesssion's end
user_conf_dir=$HOME/.config/zsh
func_dir=$user_conf_dir/functions  # add your <function-name> here and they will be auto-loaded
fpath+=($func_dir)

#################### Config actions
for _func in $func_dir/*; autoload ${_func:t}  # load custom functions

precmd () { source $user_conf_dir/aliases }  # make new aliased available right away

[[ -a $(which brew) ]] && eval "$(brew shellenv)"
[[ -a $(which starship) ]] && eval "$(starship init zsh)"
[[ -a $(which pyenv) ]] && eval "$(pyenv init -)" 

typeset -U PATH path
path=(
     /Applications/WezTerm.app/Contents/MacOS
     $HOME/go/bin
     $path
)

# as per the instructions - must run after everything else
hg=$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[[ -a $hg ]] && source $hg 
