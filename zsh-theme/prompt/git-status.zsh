# ------------------------------------------------------------------------------
# Print git status
# Credits for this logics goes to Spaceship ZSH
# https://github.com/denysdovhan/spaceship-prompt
# ------------------------------------------------------------------------------

HYPA_GIT_STATUS_PREFIX="${HYPA_GIT_STATUS_PREFIX="["}"
HYPA_GIT_STATUS_SUFFIX="${HYPA_GIT_STATUS_SUFFIX="] "}"
HYPA_GIT_STATUS_COLOR="${HYPA_GIT_STATUS_COLOR="red"}"
HYPA_GIT_STATUS_CLEAN_COLOR="${HYPA_GIT_STATUS_CLEAN_COLOR="green"}"
HYPA_GIT_STATUS_CLEAN="${HYPA_GIT_STATUS_CLEAN="✔ "}"
HYPA_GIT_STATUS_UNTRACKED="${HYPA_GIT_STATUS_UNTRACKED="?"}"
HYPA_GIT_STATUS_ADDED="${HYPA_GIT_STATUS_ADDED="✈"}"
HYPA_GIT_STATUS_MODIFIED="${HYPA_GIT_STATUS_MODIFIED="!"}"
HYPA_GIT_STATUS_RENAMED="${HYPA_GIT_STATUS_RENAMED="»"}"
HYPA_GIT_STATUS_DELETED="${HYPA_GIT_STATUS_DELETED="✘"}"
HYPA_GIT_STATUS_STASHED="${HYPA_GIT_STATUS_STASHED="$"}"
HYPA_GIT_STATUS_UNMERGED="${HYPA_GIT_STATUS_UNMERGED="✂"}"
HYPA_GIT_STATUS_AHEAD="${HYPA_GIT_STATUS_AHEAD="⇡"}"
HYPA_GIT_STATUS_BEHIND="${HYPA_GIT_STATUS_BEHIND="⇣"}"
HYPA_GIT_STATUS_DIVERGED="${HYPA_GIT_STATUS_DIVERGED="⇕"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

option-git-status() {
  hypa::is-git || return

  local INDEX git_status="" color

  INDEX=$(command git status --porcelain -b 2> /dev/null)

  # Check for untracked files
  if $(echo "$INDEX" | command grep -E '^\?\? ' &> /dev/null); then
    git_status="$HYPA_GIT_STATUS_UNTRACKED$git_status"
  fi

  # Check for staged files
  if $(echo "$INDEX" | command grep '^A[ MDAU] ' &> /dev/null); then
    git_status="$HYPA_GIT_STATUS_ADDED$git_status"
  elif $(echo "$INDEX" | command grep '^M[ MD] ' &> /dev/null); then
    git_status="$HYPA_GIT_STATUS_ADDED$git_status"
  elif $(echo "$INDEX" | command grep '^UA' &> /dev/null); then
    git_status="$HYPA_GIT_STATUS_ADDED$git_status"
  fi

  # Check for modified files
  if $(echo "$INDEX" | command grep '^[ MARC]M ' &> /dev/null); then
    git_status="$HYPA_GIT_STATUS_MODIFIED$git_status"
  fi

  # Check for renamed files
  if $(echo "$INDEX" | command grep '^R[ MD] ' &> /dev/null); then
    git_status="$HYPA_GIT_STATUS_RENAMED$git_status"
  fi

  # Check for deleted files
  if $(echo "$INDEX" | command grep '^[MARCDU ]D ' &> /dev/null); then
    git_status="$HYPA_GIT_STATUS_DELETED$git_status"
  elif $(echo "$INDEX" | command grep '^D[ UM] ' &> /dev/null); then
    git_status="$HYPA_GIT_STATUS_DELETED$git_status"
  fi

  # Check for stashes
  if $(command git rev-parse --verify refs/stash >/dev/null 2>&1); then
    git_status="$HYPA_GIT_STATUS_STASHED$git_status"
  fi

  # Check for unmerged files
  if $(echo "$INDEX" | command grep '^U[UDA] ' &> /dev/null); then
    git_status="$HYPA_GIT_STATUS_UNMERGED$git_status"
  elif $(echo "$INDEX" | command grep '^AA ' &> /dev/null); then
    git_status="$HYPA_GIT_STATUS_UNMERGED$git_status"
  elif $(echo "$INDEX" | command grep '^DD ' &> /dev/null); then
    git_status="$HYPA_GIT_STATUS_UNMERGED$git_status"
  elif $(echo "$INDEX" | command grep '^[DA]U ' &> /dev/null); then
    git_status="$HYPA_GIT_STATUS_UNMERGED$git_status"
  fi

  # Check whether branch is ahead
  local is_ahead=false
  if $(echo "$INDEX" | command grep '^## [^ ]\+ .*ahead' &> /dev/null); then
    is_ahead=true
  fi

  # Check whether branch is behind
  local is_behind=false
  if $(echo "$INDEX" | command grep '^## [^ ]\+ .*behind' &> /dev/null); then
    is_behind=true
  fi

  # Check wheather branch has diverged
  if [[ "$is_ahead" == true && "$is_behind" == true ]]; then
    git_status="$HYPA_GIT_STATUS_DIVERGED$git_status"
  else
    [[ "$is_ahead" == true ]] && git_status="$HYPA_GIT_STATUS_AHEAD$git_status"
    [[ "$is_behind" == true ]] && git_status="$HYPA_GIT_STATUS_BEHIND$git_status"
  fi

  if [[ -z $git_status ]]; then
    color="$HYPA_GIT_STATUS_CLEAN_COLOR"
    hypa::print-to-prompt "$color" "$HYPA_GIT_STATUS_CLEAN"
  else
    color="$HYPA_GIT_STATUS_COLOR"
    # Status prefixes are colorized
    hypa::print-to-prompt "$color" "$HYPA_GIT_STATUS_PREFIX$git_status$HYPA_GIT_STATUS_SUFFIX"
  fi
}