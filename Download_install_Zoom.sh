#==============================================================#
#    This script download latest version of Zoom Client        #
#==============================================================#

#!/bin/bash

#Download Zoom
curl -L -o /tmp/ZoomInstallerIT.pkg "https://zoom.us/client/latest/ZoomInstallerIT.pkg" >/dev/null 2>&1

#Go to tmp folder
cd /tmp/

#Install Zoom
installer -pkg /tmp/ZoomInstallerIT.pkg -target /Applications

#Set permissions
chown -R root:wheel /Applications/zoom.us.app
chmod -R 755 /Applications/zoom.us.app

#Remove zoom pkg
rm -rf /tmp/ZoomInstallerIT.pkg
