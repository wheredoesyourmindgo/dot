#!/bin/sh
cp hyper/.hyper.js ~/
cp vim/.vimrc vim/.gvimrc ~/
cp zsh/.zshrc zsh/.zshenv zsh/.zprofile ~/
cp ansiweather/.ansiweatherrc ~/
[ -d "$HOME/.ssh/config" ] && cp .ssh/config ~/.ssh/
[ -d "$HOME/.config/karabiner" ] && cp karabiner/karabiner.json ~/.config/karabiner/
