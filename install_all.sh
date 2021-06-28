#!/bin/sh
cp hyper/.hyper.js ~/
cp vim/.vimrc vim/.gvimrc ~/
cp zsh/.zshrc zsh/.zshenv zsh/.zprofile ~/
cp ansiweather/.ansiweatherrc ~/
[ -d "$HOME/.ssh" ] && cp ssh/config ~/.ssh/
[ "$HOME" == "/Users/abe" ] && cp git/@home/.gitconfig ~/.gitconfig
[ "$HOME" == "/Users/ahendricks" ] && cp git/@work/.gitconfig ~/.gitconfig
[ -d "$HOME/.config/karabiner" ] && cp karabiner/karabiner.json ~/.config/karabiner/
[ -d "$HOME/.config" ] && cp starship/starship.toml ~/.config/
[ -d "$HOME/Library/Services" ] && cp -R Library/Services/* ~/Library/Services/
[ -d "$HOME/Library/Application Support/iTerm2/Scripts" ] && cp -R iterm/scripts/* ~/Library/Application\ Support/iTerm2/Scripts/

# Patch .zshrc so that zplug init runs correctly depending on host
zplug_line=$(grep -n '# zplug init' ~/.zshrc | cut -d ":" -f 1)
zshrc_tmp=~/.zshrc.tmp
cp ~/.zshrc ~/.zshrc.tmp
if [[ "$OSTYPE" == "darwin"* ]]; then
	{ head -n $zplug_line $zshrc_tmp; cat zsh/partial/zplug_macos.sh; tail -n +$(($zplug_line+1)) $zshrc_tmp; } > ~/.zshrc
elif [[ $(lsb_release -d) == *"Arch"* ]]; then
	{ head -n $zplug_line $zshrc_tmp; cat zsh/partial/zplug_arch.sh; tail -n +$(($zplug_line+1)) $zshrc_tmp; } > ~/.zshrc
else
	{ head -n $zplug_line $zshrc_tmp; cat zsh/partial/zplug_source.sh; tail -n +$(($zplug_line+1)) $zshrc_tmp; } > ~/.zshrc
fi

# Patch .zshrc so that nvm init runs correctly depending on host
nvm_line=$(grep -n '# nvm init' ~/.zshrc | cut -d ":" -f 1)
cp ~/.zshrc ~/.zshrc.tmp
if [[ "$OSTYPE" == "darwin"* ]]; then
	{ head -n $nvm_line $zshrc_tmp; cat zsh/partial/nvm_macos.sh; tail -n +$(($nvm_line+1)) $zshrc_tmp; } > ~/.zshrc
elif [[ $(lsb_release -d) == *"Arch"* ]]; then
	{ head -n $nvm_line $zshrc_tmp; cat zsh/partial/nvm_arch.sh; tail -n +$(($nvm_line+1)) $zshrc_tmp; } > ~/.zshrc
else
	{ head -n $nvm_line $zshrc_tmp; cat zsh/partial/nvm_source.sh; tail -n +$(($nvm_line+1)) $zshrc_tmp; } > ~/.zshrc
fi