# ZSH_DISABLE_COMPFIX="true"

# skip line after command
precmd() { print "" }

# zplug init
# ...

# Make sure to use double quotes
#zplug "g-plane/zsh-yarn-autocompletions", hook-build:"./zplug.zsh", defer:2
zplug "zsh-users/zsh-history-substring-search"

zplug "robbyrussell/oh-my-zsh", use:"lib/*.zsh", defer:2 # Provides autocomplete for command history

# zplug "lukechilds/zsh-better-npm-completion", defer:2

# Supports oh-my-zsh plugins and the like
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/npm", from:oh-my-zsh
zplug "plugins/yarn", from:oh-my-zsh
zplug "plugins/osx", from:oh-my-zsh
# zplug "b4b4r07/enhancd", use:init.sh
zplug "peterhurford/up.zsh", use:up.plugin.zsh
#zplug "igoradamenko/npm.plugin.zsh", use: "npm.plugin.zsh"

# zplug "zsh-users/zsh-autosuggestions", use:zsh-autosuggestions.zsh
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2 # <- Must be last import
zplug load


alias htop="sudo htop"
alias vscode="code"
alias whatsonport="sudo lsof -i -n -P | grep TCP | grep -i listen"
alias handbrake='HandbrakeCLI'
alias pipenvjup='pipenv run jupyter notebook --no-browser --port=8888 --NotebookApp.allow_origin="*"'
alias kill_rsnapshot="sudo kill -9 $(ps -e | grep rsnapshot | awk '{print $1}')"
alias flush_dns="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder; say cache flushed"
alias c="clear"
alias li="ls -l"
# method 1
#alias neofetch="${aliases[neofetch]-neofetch} --block_range 0 15"
# method 2
NEOFETCH=neofetch
alias neofetch="${NEOFETCH} --block_range 0 15"
alias weather="ansiweather"

gitall() {
    git add .
    if [ "$1" != "" ] # or better, if [ -n "$1" ]
    then
        git commit -m "$1"
    else
        git commit -m update
    fi
    git push
}

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi
# If using pyenv on linux there is some code to add here regarding paths. see https://github.com/pyenv/pyenv#basic-github-checkout for more info.

## rehash slow at load. rehash in the background.
##if which pyenv > /dev/null; then eval "$(pyenv init - --no-rehash)"; fi
##(pyenv rehash &) 2> /dev/null

## jEnv See http://www.jenv.be/
# export PATH="$HOME/.jenv/bin:$PATH"
## rehash slow at load. rehash in the background.
##if which jenv > /dev/null; then eval "$(jenv init - --no-rehash)"; fi
##(jenv rehash &) 2> /dev/null
##
##eval "$(jenv init -)"
#if which jenv > /dev/null; then eval "$(jenv init -)"; fi
alias jenv-init='if which jenv > /dev/null; then eval "$(jenv init -)"; fi'

# assume i wan't to update atom
alias apmu='apm update --no-confirm'
alias brewu='brew update && brew upgrade'

alias download='$HOME/.download.sh'

# iTerm2.9 Shell Integration
if [[ "$OSTYPE" == "darwin"* ]]; then
  source ~/.iterm2_shell_integration.zsh
fi

# see alternate script for terminating kapersky
#alias kill_kapersky="sudo killall -SIGKILL klnagent && sudo killall -SIGKILL kav && sudo killall -SIGKILL kav_agent"

alias delete_terminal_logs="sudo rm -v /var/log/asl/*.asl"

alias screenfetch="screenfetch -E"

# angular cli auto completion via output of `ng completion` command
#source ~/.ng-completion.sh

alias vi="vim"
alias macvim='mvim'
function vim {
  DARK_MODE=$(dark-mode status)

  if [[ "$DARK_MODE" == "on" ]]; then
    env vim --cmd "let theme = 'dark'" $@
  else
    env vim --cmd "let theme = 'light'" $@
  fi
}

# yarn/npm
alias yarno="yarn outdated"
alias yarnu="yarn upgrade-interactive"
alias npmgu="npm-check -gu"
alias yarngu="yarn global upgrade-interactive"
alias npmu="npm-check -u"
alias npmo="npm outdated"
alias npms="npm start"
alias yarns="yarn start"
alias npmi="npm install"
alias yarni="yarn install"
alias npmgls="npm ls -g --depth 0"
alias yarngls="yarn global list"
alias n="npm"
alias y="yarn"

# Banner
#neofetch --color_blocks off | lolcat
#fortune | cowsay
fortune | cowsay -f small | lolcat

export NVM_DIR="$HOME/.nvm"
# nvm init
# ...

# Auto switch using .nvmrc
autoload -Uz add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='code'
fi

# See https://stackoverflow.com/questions/6205157/how-to-set-keyboard-shortcuts-to-jump-to-beginning-end-of-line/29403520#29403520 for more info
# changes hex 0x15 to delete everything to the left of the cursor,
# rather than the whole line
bindkey "^U" backward-kill-line
# binds hex 0x18 0x7f with deleting everything to the left of the cursor
bindkey "^X\\x7f" backward-kill-line
# adds redo
bindkey "^X^_" redo

# tabtab source for yarn package
# uninstall by removing these lines or running `tabtab uninstall yarn`
#[[ -f /Users/ahendricks/.config/yarn/global/node_modules/yarn-completions/node_modules/tabtab/.completions/yarn.zsh ]] && . /Users/ahendricks/.config/yarn/global/node_modules/yarn-completions/node_modules/tabtab/.completions/yarn.zsh

# Set Spaceship ZSH as a prompt
# autoload -U promptinit; promptinit
#prompt spaceship

# set Starship as a prompt
eval "$(starship init zsh)"
