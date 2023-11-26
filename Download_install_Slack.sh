#==============================================================#
#       This script download latest version of Slack           #
#==============================================================#

#!/bin/bash

# Download Slack supplied DMG file into /tmp/
curl -L 'https://slack.com/ssb/download-osx' -o /tmp/Slack.dmg

# Mount slack supplied DMG File
hdiutil attach /tmp/Slack.dmg -nobrowse

#3 seconds pause
Sleep 3

# Copy contents of slack supplied DMG file to /Applications/
# Using * because real name of dmg file is Slack420921516146465233
cp -R /Volumes/Slack*/Slack.app /Applications

# Unmount the vendor supplied DMG file
hdiutil unmount "/Volumes/Slack*" -quiet

# Remove the downloaded vendor supplied DMG file
rm -f /tmp/Slack.dmg
