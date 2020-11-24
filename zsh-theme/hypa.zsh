# ------------------------------------------------------------------------------
# Hypa 4 ZSH
# Author: Luiz Felicio
# License: MIT
# ------------------------------------------------------------------------------
# Initialization
# ------------------------------------------------------------------------------

# Exporting theme working directory to an ENV 
export HYPA_DIR=${0:A:h}

# Initialize function utils
source $HYPA_DIR/utils/functions.zsh

# Initialize prompt utils
source $HYPA_DIR/utils/prompt.zsh

# ------------------------------------------------------------------------------
# Default Prompt Options
# ------------------------------------------------------------------------------

if [[ -z "$HYPA_PROMPT_OPTIONS" ]]; then
  HYPA_PROMPT_OPTIONS=(
    new-line
    prefix
    user-name
    dir
    git-branch
    git-status
    exec-time
    new-line
    char
  )
fi

# ------------------------------------------------------------------------------
# Sourcing prompt options
# Like a LEGO, we fit all options into a single prompt
# ------------------------------------------------------------------------------

for option in $HYPA_PROMPT_OPTIONS; do
  if [[ -f "$HYPA_DIR/prompt/$option.zsh" ]]; then
    source "$HYPA_DIR/prompt/$option.zsh"
  else
    echo "Failed to load '$option' prompt option.."
  fi
done

# ------------------------------------------------------------------------------
# Prompt setup
# ------------------------------------------------------------------------------
preexec() {
  # Mark execution start time to exec-time prompt
  HYPA_EXEC_TIME_start=$(date +%s)
}
precmd() {
  # Populate VCS variables
  vcs_info

  # Mark execution end time to exec-time prompt
  [[ -n $HYPA_EXEC_TIME_LAPSED ]] && unset HYPA_EXEC_TIME_LAPSED
  [[ -z $HYPA_EXEC_TIME_start ]] && return
  local HYPA_EXEC_TIME_end=$(date +%s)
  HYPA_EXEC_TIME_LAPSED=$(( $HYPA_EXEC_TIME_end - $HYPA_EXEC_TIME_start ))
  unset HYPA_EXEC_TIME_start
}

compose-prompt() {
  # Get exit code from last command executed.
  # Used to color cursor char based on status
  RETVAL=$?
  
  # Force filename generation when passing arguments
  setopt EXTENDED_GLOB LOCAL_OPTIONS

  # Use OPTIONS array to compose whole prompt
  # Like a LEGO :)
  # Invoke OPTION if it's a function
  # Otherwise print 'not found'
  for option in $HYPA_PROMPT_OPTIONS; do
    if hypa::defined-func "option-$option"; then
      option-$option
    else
      print -P "Option $option not found..."
    fi
  done
}

hypa-init() {
  # Version Control System
  # Allows us to get information about git
  autoload -Uz vcs_info  
  zstyle ':vcs_info:*' enable git
  zstyle ':vcs_info:git*' formats '%b'

  PROMPT='$(compose-prompt)'
}

# ------------------------------------------------------------------------------
# Prompt entry point
# ------------------------------------------------------------------------------
hypa-init "$@"

# Light: ZSH_THEME_PROMPT+=" in %B%F{blue}text%F%B"
# Normal: ZSH_THEME_PROMPT+=" in %{$fg[blue]%}text%f"