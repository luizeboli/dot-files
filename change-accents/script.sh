#!/bin/zsh

#  Note that AppleAquaColorVariant is alway "1" except for "Graphite", where it is "6".
#  Note that the AccentColor "Blue" is default (when there is no entry) and has no AppleHighlightColor definition.
#
#  Color    AppleAquaColorVariant    AccentColor    AppleHighlightColor
#    Red            1                   0           "1.000000 0.733333 0.721569 Red"
#    Orange         1                   1           "1.000000 0.874510 0.701961 Orange"
#    Yellow         1                   2           "1.000000 0.937255 0.690196 Yellow"
#    Green          1                   3           "0.752941 0.964706 0.678431 Green"
#    Purple         1                   5           "0.968627 0.831373 1.000000 Purple"
#    Pink           1                   6           "1.000000 0.749020 0.823529 Pink"
#    Blue           1                   deleted     deleted
#    Graphite       6                   -1          "0.847059 0.847059 0.862745 Graphite"
#    Multicolor     1                   -2          ""

ACCENT_OPTIONS=(
  -2
  -1
  0
  1
  2
  3
  4
  5
  6
)

HIGHLIGHT_OPTIONS=(
  ""
  "1.000000 0.733333 0.721569 Red"
  "1.000000 0.874510 0.701961 Orange"
  "1.000000 0.937255 0.690196 Yellow"
  "0.752941 0.964706 0.678431 Green"
  "0.968627 0.831373 1.000000 Purple"
  "1.000000 0.749020 0.823529 Pink"
  "0.847059 0.847059 0.862745 Graphite"
)

ACCENT=${ACCENT_OPTIONS[$[$RANDOM % ${#ACCENT_OPTIONS[@]}]]}
HIGHLIGHT=${HIGHLIGHT_OPTIONS[$[$RANDOM % ${#HIGHLIGHT_OPTIONS[@]}]]}

if [[ $ACCENT -eq -2 ]]
then
  echo ACCENT É -2, VOU SETAR O HIGHLIGHT PRO MULTICOLOR
  HIGHLIGHT=""
fi

if [[ -z $HIGHLIGHT && $ACCENT -ne -2 ]]
then
  echo HIGHLIGHT É VAZIO. SETANDO ACCENT PRA -2
  ACCENT=-2
fi

echo ACCENT IS $ACCENT
echo HIGHLIGHT IS $HIGHLIGHT

defaults write -globalDomain "AppleAquaColorVariant" -int 1
defaults write -globalDomain "AppleAccentColor" -int $ACCENT
defaults write -globalDomain "AppleHighlightColor" -string "$HIGHLIGHT"
