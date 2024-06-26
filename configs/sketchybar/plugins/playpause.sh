#!/bin/bash

# Check the current player state of Spotify
state=$(osascript -e 'tell application "Spotify" to get player state')

# Toggle play/pause based on the current state
if [ "$state" = "playing" ]; then
	osascript -e 'tell application "Spotify" to pause'
else
	osascript -e 'tell application "Spotify" to play'
fi
