config_dir = $HOME/.config

brew:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

base: brew
	brew install \
		git \
		stow \
		fish \
		ripgrep
	mkdir $config_dir

tools:
	brew install starship

nerd-fonts:
	brew tap homebrew/cask-fonts && \
		brew install --cask font-jetbrains-mono-nerd-font

shell: base tools nerd-fonts
	stow terminal-emulators -t $config_dir
	stow prompts -t $config_dir


