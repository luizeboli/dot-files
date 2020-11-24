# ------------------------------------------------------------------------------
# Print working directory
# ------------------------------------------------------------------------------

HYPA_DIR_PREFIX="${HYPA_DIR_PREFIX="in "}"
HYPA_DIR_SUFFIX="${HYPA_DIR_SUFFIX=" "}"
HYPA_DIR_COLOR="${HYPA_DIR_COLOR="white"}"

# ------------------------------------------------------------------------------
# Prompt
# ------------------------------------------------------------------------------

option-dir() {
  local 'color' 'dir'
  color="$HYPA_DIR_COLOR"
  dir="$(hypa::get-pwd)"
  
  hypa::print-to-prompt "$color" "$HYPA_DIR_PREFIX" "$dir" "$HYPA_DIR_SUFFIX"   
}