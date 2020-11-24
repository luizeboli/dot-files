# ------------------------------------------------------------------------------
# Print prompt prefix
# ------------------------------------------------------------------------------

HYPA_PROMPT_PREFIX_PREFIX="${HYPA_PROMPT_PREFIX_PREFIX=""}"
HYPA_PROMPT_PREFIX_SUFFIX="${HYPA_PROMPT_CHAR_SUFFIX=" "}"
HYPA_PROMPT_PREFIX_CHAR="${HYPA_PROMPT_PREFIX_CHAR="╭"}"
HYPA_PROMPT_PREFIX_SUCCESS="${HYPA_PROMPT_PREFIX_SUCCESS="green"}"
HYPA_PROMPT_PREFIX_FAIL="${HYPA_PROMPT_PREFIX_FAIL="red"}"

# ------------------------------------------------------------------------------
# Prompt
# ------------------------------------------------------------------------------

option-prefix() {
  local 'color'

  if [[ $RETVAL -eq 0 ]]; then
    color="$HYPA_PROMPT_PREFIX_SUCCESS"
  else
    color="$HYPA_PROMPT_PREFIX_FAIL"
  fi

  hypa::print-to-prompt "$color" "$HYPA_PROMPT_PREFIX_PREFIX" "$HYPA_PROMPT_PREFIX_CHAR" "$HYPA_PROMPT_PREFIX_SUFFIX"
}