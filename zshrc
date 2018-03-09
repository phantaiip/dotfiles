# ##################################################################################################
# Default settings
# ##################################################################################################

# If you come from bash you might have to change your $PATH.
#export PATH=$HOME/bin:/usr/local/bin:$PATH

PATH="/usr/local/bin:$PATH"
PATH="/usr/local/sbin:$PATH"
PATH="$HOME/bin:$PATH"
PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
export PATH

export VISUAL=nvim
export EDITOR="$VISUAL"
export TERM=xterm-256color-italic
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="/usr/local/opt/node@6/bin:$PATH"

# composer
export PATH="$HOME/.composer/vendor/bin:$PATH"

# go
export GOPATH="$HOME/go"
export PATH="$PATH:/usr/local/opt/go/libexec/bin"

# mysql
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

# java
export JAVA_HOME=$(/usr/libexec/java_home)

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="bira"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# ##################################################################################################
# Aliases
# ##################################################################################################

# common commands
alias c="clear"
alias e="exit"
alias v="nvim"
alias l="gls --color -lh --group-directories-first"
alias ls="gls --color -lh --group-directories-first"
alias la="gls --color -lha --group-directories-first"
alias emj="cat ~/Documents/Git/emoji_prefix_template.txt"

# npm
alias ni="npm install"
alias nid="npm install --save-dev"
alias nun="npm uninstall"
alias ns="npm start"
alias nt="npm test"
alias nr="npm run"

# colorized cat
alias cat="ccat"

# grep
alias -g G='| grep'

# recursively delete `.DS_Store` files from current folder
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# serve current directory on port 8080
alias serve="python -m SimpleHTTPServer 8080"

# get current ip
alias getip="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"

# use the correct term for ssh
alias ssh="TERM=xterm-256color ssh"

# tmux
alias t="tmux"
alias tls="tmux ls"
alias tnew="tmux new -s"
alias ta="tmux a"
alias tat="tmux a -t"
alias tkill="tmux kill-session -t"
alias tses='tmux new -As $(basename $PWD | tr . -)'

# yarn
alias y="yarn"
alias ya="yarn add"
alias yad="yarn add --dev"
alias yrem="yarn remove"
alias ys="yarn start"
alias yt="yarn test"
alias yr="yarn run"

# workspace
alias p="cd ~/Projects"
alias df="cd ~/.dotfiles"
alias d="cd ~/Documents/development && clear"


# add autocompletions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
