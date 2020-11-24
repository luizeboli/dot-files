# ------------------------------------------------------------------------------
# Print last command execution time
# ------------------------------------------------------------------------------

HYPA_EXEC_TIME_PREFIX="${HYPA_EXEC_TIME_PREFIX="took "}"
HYPA_EXEC_TIME_SUFFIX="${HYPA_EXEC_TIME_SUFFIX=" "}"
HYPA_EXEC_TIME_MIN="${HYPA_EXEC_TIME_MIN="3"}"
HYPA_EXEC_TIME_COLOR="${HYPA_EXEC_TIME_COLOR="yellow"}"

# ------------------------------------------------------------------------------
# Prompt
# ------------------------------------------------------------------------------

option-exec-time() {
  if [[ $HYPA_EXEC_TIME_LAPSED -ge $HYPA_EXEC_TIME_MIN ]]; then
    hypa::print-to-prompt "$HYPA_EXEC_TIME_COLOR" "$HYPA_EXEC_TIME_PREFIX" "$(hypa::format-time $HYPA_EXEC_TIME_LAPSED)" "$HYPA_EXEC_TIME_SUFFIX"
  fi
}