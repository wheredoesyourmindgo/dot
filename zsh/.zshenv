export SHELL=/bin/zsh
#export SHELL=/usr/local/bin/zsh

#export TERM="xterm-256color"


# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

# postgres
export PGHOST=gis-db.pcwanetwork.net
export PGUSER=ahendricks
export PGDATABASE=gdb
#export PGPASS=$HOME/.pgpass # default

export SPACESHIP_CHAR_SYMBOL=\❯
#export SPACESHIP_CHAR_SYMBOL=\$
#export SPACESHIP_CHAR_SUFFIX=" "

# /Library/Tex/texbin for use with chktext. See `brew info checktex`
export PATH="$HOME/.bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/Library/TeX/texbin:$PATH"

### Homebrew pkgs
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"
export PATH="/usr/local/opt/sqlite/bin:$PATH"
export PATH="/usr/local/opt/libpq/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
#export PATH="$PATH:/usr/local/opt/gdal2/bin"
##

# brew info gdal2 for more info.
#export GDAL_DRIVER_PATH=/usr/local/lib/gdalplugins

# PIP user installed packages
# 
#export PATH="$HOME/Library/Python/3.6/bin:$HOME/Library/Python/2.7/bin:$PATH"

# php
#export PATH="$(brew --prefix homebrew/php/php71)/bin:$PATH"

# Homebrew
HOMEBREW_INSTALL_CLEANUP=1

# If pyenv install x.xx gives errors try uncommenting the following. 
#export LDFLAGS="-L/usr/local/opt/sqlite/lib: $LDFLAGS"
#export LDFLAGS="-L/usr/local/opt/zlib/lib: $LDFLAGS"
#export CPPFLAGS="-I/usr/local/opt/sqlite/include: $CPPFLAGS"
#export CPPFLAGS="-I/usr/local/opt/zlib/include: $CPPFLAGS"

# Composer Global Bin
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Android Development
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$ANDROID_HOME/build-tools/26.0.2" # current version

# Fixes issue with Mapbox CLI
# export LC_ALL=en_US.UTF-8
# export LANG=en_US.UTF-8

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# /usr/libexec/path_helper is re-ordering path. This is a hack to preserve the path created above.
# See .zprofile for merge script
export PATH_SAVE=$PATH

# command-time zsh plugin
# If command execution time above min. time, plugins will not output time.
ZSH_COMMAND_TIME_MIN_SECONDS=10
