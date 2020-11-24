# ------------------------------------------------------------------------------
# Prompt functions
# ------------------------------------------------------------------------------

# Print prompt option
# Bold is set as default
hypa::print-to-prompt() {
  local color prefix content suffix
  [[ -n $1 ]] && color="%F{$1}"  || color="%f"
  [[ -n $2 ]] && prefix="$2"     || prefix=''
  [[ -n $3 ]] && content="$3"    || content=""
  [[ -n $4 ]] && suffix="$4"     || suffix=""

  # Possibility to pass only 2 arguments: color and content
  [[ -z $3 && -z $4 ]] && content=$2 prefix=''

  # Set bold
  echo -n "%{%B%}"
  # Set prefix
  echo -n "$prefix"
  # Set color
  echo -n "%{$color%}" # set color
  # Set content
  echo -n "$content"
  # Unset color
  echo -n "%{%f%}"
  # Set suffix
  echo -n "$suffix"
  # Unset bold
  echo -n "%{%b%}"
}