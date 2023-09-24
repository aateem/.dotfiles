user_config_dir = $HOME/.config

brew:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

base: 
	brew install git stow ripgrep exa starship zsh-syntax-highlighting && \
	brew tap homebrew/cask-fonts && \
	brew install --cask font-jetbrains-mono-nerd-font 

python: 
	brew install pyenv pipx && pipx ensurepath

config: 
	mkdir $user_config_dir
	stow starship zsh
