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
line=$(grep -n 'zplug init' zsh/.zshrc | cut -d ":" -f 1)
if [[ "$OSTYPE" == "darwin"* ]]; then
	{ head -n $line zsh/.zshrc; cat zsh/partial/zsh_macos.sh; tail -n +$(($line+1)) zsh/.zshrc; } > ~/.zshrc
elif [[ $(lsb_release -d) == *"Arch"* ]]; then
	{ head -n $line zsh/.zshrc; cat zsh/partial/zsh_arch.sh; tail -n +$(($line+1)) zsh/.zshrc; } > ~/.zshrc
else
	{ head -n $line zsh/.zshrc; cat zsh/partial/zsh_source.sh; tail -n +$(($line+1)) zsh/.zshrc; } > ~/.zshrc
fi