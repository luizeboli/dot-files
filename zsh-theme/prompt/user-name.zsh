# ------------------------------------------------------------------------------
# Print username
# ------------------------------------------------------------------------------

HYPA_USER_PREFIX="${HYPA_USER_PREFIX=""}"
HYPA_USER_SUFFIX="${HYPA_USER_SUFFIX=" "}"
HYPA_ROOT_USER_COLOR="${HYPA_ROOT_USER_COLOR="red"}"
HYPA_USER_COLOR="${HYPA_USER_COLOR="black"}"

# ------------------------------------------------------------------------------
# Prompt
# ------------------------------------------------------------------------------

option-user-name() {
  local 'color' 'user'

  if [[ $UID -eq 0 ]]; then
    color="$HYPA_ROOT_USER_COLOR"
  else
    color="$HYPA_USER_COLOR"
  fi

  hypa::print-to-prompt "$color" "$HYPA_USER_PREFIX" "%n" "$HYPA_USER_SUFFIX"
}