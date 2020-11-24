# ------------------------------------------------------------------------------
# Print prompt character
# ------------------------------------------------------------------------------

HYPA_PROMPT_CHAR_PREFIX="${HYPA_PROMPT_CHAR_PREFIX=""}"
HYPA_PROMPT_CHAR_SUFFIX="${HYPA_PROMPT_CHAR_SUFFIX=" "}"
HYPA_PROMPT_CHAR="${HYPA_PROMPT_CHAR="╰→"}"
HYPA_PROMPT_CHAR_SUCCESS="${HYPA_PROMPT_SUCCESS="green"}"
HYPA_PROMPT_CHAR_FAIL="${HYPA_PROMPT_CHAR_FAIL="red"}"

# ------------------------------------------------------------------------------
# Prompt
# ------------------------------------------------------------------------------

option-char() {
  local 'color'

  if [[ $RETVAL -eq 0 ]]; then
    color="$HYPA_PROMPT_SUCCESS"
  else
    color="$HYPA_PROMPT_CHAR_FAIL"
  fi

  hypa::print-to-prompt "$color" "$HYPA_PROMPT_CHAR_PREFIX" "$HYPA_PROMPT_CHAR" "$HYPA_PROMPT_CHAR_SUFFIX"
}