#!/bin/sh

# Display free space
FreeSpace=$( /usr/sbin/diskutil info / | /usr/bin/grep  -E 'Free Space|Available Space|Container Free Space' | /usr/bin/awk -F ":\s*" '{ print $2 }' | awk -F "(" '{ print $1 }' | xargs )
FreeBytes=$( /usr/sbin/diskutil info / | /usr/bin/grep -E 'Free Space|Available Space|Container Free Space' | /usr/bin/awk -F "(\\\(| Bytes\\\))" '{ print $2 }' )
DiskBytes=$( /usr/sbin/diskutil info / | /usr/bin/grep -E 'Total Space' | /usr/bin/awk -F "(\\\(| Bytes\\\))" '{ print $2 }' )
FreePercentage=$(echo "scale=2; $FreeBytes*100/$DiskBytes" | bc)
diskSpace="Disk Space: $FreeSpace free (${FreePercentage}% available)"

echo $diskSpace

## Send a message to end user ##
displayInfo="----------------------------------------------

Your Disk Space is running low

$diskSpace

Full disks prevent security updates on your macbook !

-------------------------------------------------

Please delete unneeded datas to free up your disk. 

Some steps to follow: 

* Clean your Downloads / Documents / Desktop folders
* Empty your bin 
* Reboot your computer ( could clean some cache )

----------------------------------------------"


## Disk Space Message ##
diskmsg="button returned of (display dialog \"$displayInfo\" with title \"Disk Space\" with icon file posix file \"/System/Library/CoreServices/Diagnostics Reporter.app/Contents/Resources/AppIcon.icns\" buttons {\"OK\"} default button {\"OK\"})"

clickedButton=$( /usr/bin/osascript -e "$diskmsg" )
## Send a message to end user ##

## Run additional commands #####
exit 0
