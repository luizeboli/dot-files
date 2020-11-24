#!/usr/bin/env zsh
# ------------------------------------------------------------------------------
# Initialization
# ------------------------------------------------------------------------------

ZSHRC="$HOME/.zshrc"
THEME_SOURCE="$PWD/hypa.zsh"
THEME_DEST="$HOME/.oh-my-zsh/custom/themes"
THEME_NAME="${THEME_SOURCE:t:r}"
THEME_SYMLINK="$THEME_DEST/$THEME_NAME.zsh-theme"
FULL_THEME_NAME="ZSH_THEME=\"hypa\""

# ------------------------------------------------------------------------------
# Utilities
# ------------------------------------------------------------------------------

# Use tput to set colors
if [[ ! -z $(which tput 2> /dev/null) ]]; then
  reset=$(tput sgr0)
  bold=$(tput bold)
  red=$(tput setaf 1)
  green=$(tput setaf 2)
  yellow=$(tput setaf 3)
  cyan=$(tput setaf 6)
fi

print() {
  local color=$1 rest=${@:2}
  echo "$color$rest$reset\n"
}

info()    { print "$cyan"   "$@" ; }
success() { print "$bold$green"  "$@" ; }
error()   { print "$bold$red"    "$@" ; }
warn()    { print "$yellow" "$@" ; }

# ------------------------------------------------------------------------------
# ZSH Setup
# ------------------------------------------------------------------------------

init() {
  info "Trying to install hypa theme..."

  # Exit if file not found
  [[ ! -f "$THEME_SOURCE" ]] && error "Could not find theme source..." && exit 1

  cd ..
  
  info "Copying theme directory to oh-my-zsh custom themes folder..."
  cp -R "./$THEME_NAME" "$THEME_DEST"

  if [[ -h "$THEME_SYMLINK" ]]; then
    warn "Symbolic link already exists, skipping..."
  else 
    info "Creating a symbolic link into oh-my-zsh custom themes folder..."
    ln -s "$THEME_DEST/$THEME_NAME/$THEME_NAME.zsh" "$THEME_SYMLINK"
  fi     

  info "Changing theme on .zshrc..."
  sed -i'.bkp' -e "s/.*ZSH_THEME=\".*\".*/$FULL_THEME_NAME/" $ZSHRC || { error "Could not change theme on .zshrc due above error.\nPlease modify it to 'hypa' manually..."; exit 1 }

  success "Theme installed successfully! Enjoy :)"
  exit 0
}

# ------------------------------------------------------------------------------
# Starts all
# ------------------------------------------------------------------------------

init "$@"