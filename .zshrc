# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Paath to your oh-my-zsh installation.
export ZSH="/home/lfelicio/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="hypa"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(git zsh-autosuggestions ssh-agent zsh-nvm zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# history size
HISTSIZE=5000
HISTFILESIZE=10000

SAVEHIST=5000
setopt EXTENDED_HISTORY

# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY
# do not store duplications
setopt HIST_IGNORE_DUPS

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Custom aliases
alias zshcfg="nano ~/.zshrc"
alias rtzsh="source ~/.zshrc"
alias ohmyzsh="nano ~/.oh-my-zsh"
alias gcam='git commit -n -a -m'
alias ggsup='git branch --set-upstream-to=origin/$(git_current_branch)'
alias gcmsg="git commit -n -m"
alias glt="git fetch --all --prune && git describe --tags \$(git rev-list --tags --max-count=1)"
alias chromecors="open -n -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --user-data-dir='/tmp/chrome_dev_test' --disable-web-security"
alias flush-npm="rm -rf ./node_modules && rm package-lock.json && npm i"
alias ns="npm start"
alias c="code ."

# Key binding
bindkey '^I' autosuggest-accept
bindkey '^ ' autosuggest-execute
bindkey '[I' expand-or-complete

# Plugin Configuration
GIT_AUTO_FETCH_INTERVAL=300

# Kill node process on specified port
function kill-node () {
  netstat -anp 2> /dev/null |
  grep :$@ |
  egrep -o "[0-9]+/node" |
  cut -d'/' -f1 |
  xargs kill;
}

# Modify buffer to `git checkout $BRANCH` if command starts with `vs-`
# Must be in a git repository
# custom-accept-line() {
#   if [[ ${BUFFER[1,3]} == "vs-" ]]; then
#     if [[ $(command git rev-parse --is-inside-work-tree 2>/dev/null) == true ]]; then
#       echo "$(date +%d.%m.%y-%H:%M:%S) Usei a $BUFFER..." >> ~/log-of-fanti.txt
#       BUFFER="git checkout $BUFFER"
#     fi
#   fi  
  
#   zle accept-line
# }

# zle -N custom-accept-line
# bindkey '^M' custom-accept-line
