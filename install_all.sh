#!/bin/sh
cp hyper/.hyper.js ~/
cp vim/.vimrc vim/.gvimrc ~/
cp zsh/.zshrc zsh/.zshenv zsh/.zprofile ~/
cp ansiweather/.ansiweatherrc ~/
[ -d "$HOME/.ssh" ] && cp .ssh/config ~/.ssh/
[ -d "$HOME/.config/karabiner" ] && cp karabiner/karabiner.json ~/.config/karabiner/
[ -d "$HOME/Library/Services" ] && cp Library/Services/* ~/Library/Services/
