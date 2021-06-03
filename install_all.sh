#!/bin/sh
cp hyper/.hyper.js ~/
cp vim/.vimrc vim/.gvimrc ~/
cp zsh/.zshrc zsh/.zshenv zsh/.zprofile ~/
cp ansiweather/.ansiweatherrc ~/
[ -d "$HOME/.ssh" ] && cp .ssh/config ~/.ssh/
[ -d "$HOME/.config/karabiner" ] && cp karabiner/karabiner.json ~/.config/karabiner/
[ -d "$HOME/.config" ] && cp starship/starship.toml ~/.config/
[ -d "$HOME/Library/Services" ] && cp -R Library/Services/* ~/Library/Services/
[ -d "$HOME/Library/Application Support/iTerm2/Scripts" ] && cp -R iterm/scripts/* ~/Library/Application\ Support/iTerm2/Scripts/
