#!/bin/sh -e

# This script will install the script that changes accent and highglight color

echo Creating scripts folder and log files
mkdir -p ~/scripts/change-accents
touch ~/scripts/change-accents/stderr.log
touch ~/scripts/change-accents/stdout.log

echo Copying accent script to scripts folder
cp ./script.sh ~/scripts/change-accents/script.sh

echo Copying agent plist to launchd folder
mkdir -p ~/Library/LaunchAgents
cp ./com.local.accents.plist ~/Library/LaunchAgents/com.local.accents.plist

echo Loading launchd
launchctl load ./com.local.accents.plist
