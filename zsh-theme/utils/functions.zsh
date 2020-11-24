# ------------------------------------------------------------------------------
# Utilities
# ------------------------------------------------------------------------------

# Returns current working directory
hypa::get-pwd() {
  echo "${PWD/$HOME/~}"
}

# Set variable with provided value if not previously defined on .zshrc
hypa::defined() {
  [[ ! -z "${(tP)1}" ]]
}

# Returns if function is defined
hypa::defined-func() {
  typeset -f + "$1" &> /dev/null
}

# Returns success color if no errors on last command, error color otherwise
hypa::retval-color() {
  echo "%(?.$ZSH_THEME_COLOR_SUCCESS.$ZSH_THEME_COLOR_FAILURE)"
}

# Returns if current directory is a git repository
hypa::is-git() {
  [[ $(command git rev-parse --is-inside-work-tree 2>/dev/null) == true ]]
}

# Formats time
hypa::format-time() {
  local T=$1
  local D=$((T/60/60/24))
  local H=$((T/60/60%24))
  local M=$((T/60%60))
  local S=$((T%60))
  [[ $D > 0 ]] && printf '%dd ' $D
  [[ $H > 0 ]] && printf '%dh ' $H
  [[ $M > 0 ]] && printf '%dm ' $M
  printf '%ds' $S
}