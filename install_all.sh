#!/bin/sh
cp hyper/.hyper.js "$HOME/"
cp vim/.vimrc vim/.gvimrc "$HOME/"
cp zsh/.zshrc zsh/.zshenv zsh/.zprofile "$HOME/"
cp ansiweather/.ansiweatherrc "$HOME/"
[ -d "$HOME/.ssh" ] && cp ssh/config "$HOME/.ssh/"
[ "$HOME" == "/Users/abe" ] && cp git/@home/.gitconfig "$HOME/.gitconfig"
[ "$HOME" == "/Users/ahendricks" ] && cp git/@work/.gitconfig "$HOME/.gitconfig"
[ -d "$HOME/.config/karabiner" ] && cp karabiner/karabiner.json "$HOME/.config/karabiner/"
[ -d "$HOME/.config" ] && cp starship/starship.toml "$HOME/.config/"
[ -d "$HOME/Library/Services" ] && cp -R Library/Services/* "$HOME/Library/Services/"
[ -d "$HOME/Library/Application Support/iTerm2/Scripts" ] && cp -R iterm/scripts/* "$HOME/Library/Application Support/iTerm2/Scripts/"
[ -d "$HOME/Library/Application Support/Code/User" ] && cp vscode/keybindings.json "$HOME/Library/Application Support/Code/User/"

# Patch .zshrc so that zplug init runs correctly depending on host
zplug_line=$(grep -n '# zplug init' ~/.zshrc | cut -d ":" -f 1)
zshrc_tmp=~/.zshrc.tmp
cp ~/.zshrc ~/.zshrc.tmp
if [[ "$OSTYPE" == "darwin"* ]]; then
	{ head -n $zplug_line $zshrc_tmp; cat zsh/partial/zplug_macos.sh; tail -n +$(($zplug_line+2)) $zshrc_tmp; } > ~/.zshrc
elif [[ $(lsb_release -d) == *"Arch"* ]]; then
	{ head -n $zplug_line $zshrc_tmp; cat zsh/partial/zplug_arch.sh; tail -n +$(($zplug_line+2)) $zshrc_tmp; } > ~/.zshrc
else
	{ head -n $zplug_line $zshrc_tmp; cat zsh/partial/zplug_source.sh; tail -n +$(($zplug_line+2)) $zshrc_tmp; } > ~/.zshrc
fi

# Patch .zshrc so that nvm init runs correctly depending on host
nvm_line=$(grep -n '# nvm init' ~/.zshrc | cut -d ":" -f 1)
cp ~/.zshrc ~/.zshrc.tmp
if [[ "$OSTYPE" == "darwin"* ]]; then
	{ head -n $nvm_line $zshrc_tmp; cat zsh/partial/nvm_macos.sh; tail -n +$(($nvm_line+2)) $zshrc_tmp; } > ~/.zshrc
elif [[ $(lsb_release -d) == *"Arch"* ]]; then
	{ head -n $nvm_line $zshrc_tmp; cat zsh/partial/nvm_arch.sh; tail -n +$(($nvm_line+2)) $zshrc_tmp; } > ~/.zshrc
else
	{ head -n $nvm_line $zshrc_tmp; cat zsh/partial/nvm_source.sh; tail -n +$(($nvm_line+2)) $zshrc_tmp; } > ~/.zshrc
fi

# clean up tmp files
rm $zshrc_tmp