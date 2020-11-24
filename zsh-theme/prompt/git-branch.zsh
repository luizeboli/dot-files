# ------------------------------------------------------------------------------
# Print working git branch if in a git repository
# ------------------------------------------------------------------------------

HYPA_GIT_BRANCH_PREFIX="${HYPA_GIT_BRANCH_PREFIX="on "}"
HYPA_GIT_BRANCH_SUFFIX="${HYPA_GIT_BRANCH_SUFFIX=" "}"
HYPA_GIT_BRANCH_COLOR="${HYPA_GIT_BRANCH_COLOR="blue"}"

# ------------------------------------------------------------------------------
# Prompt
# ------------------------------------------------------------------------------

option-git-branch() {
  hypa::is-git || return
  
  local color="$HYPA_GIT_BRANCH_COLOR"
  local git_current_branch="$vcs_info_msg_0_"
  [[ -z "$git_current_branch" ]] && return
  git_current_branch=" $git_current_branch"

  hypa::print-to-prompt "$color" "$HYPA_GIT_BRANCH_PREFIX" "$git_current_branch" "$HYPA_GIT_BRANCH_SUFFIX"
}