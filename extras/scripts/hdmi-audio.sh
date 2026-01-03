#!/usr/bin/bash

# This script dynamically switches the audio output between the internal
# audio (analog) and HDMI output on your system.
# It checks the current active profile and toggles to the other available profile accordingly.

# Find the main audio card
CARD=$(pactl list cards short | awk '{print $2; exit}')

# Get the current active profile
ACTIVE=$(pactl list cards | awk -v card="$CARD" '
    $1=="Name:" && $2==card {found=1}
    found && /Active Profile:/ {print substr($0, index($0,$3)); exit}
')

# Decide the new profile
if [[ "$ACTIVE" == *hdmi* ]]; then
    NEW_PROFILE="output:analog-stereo+input:analog-stereo"
    echo "Switching to internal audio..."
else
    NEW_PROFILE="output:hdmi-stereo"
    echo "Switching to HDMI..."
fi

# Apply the profile change
pactl set-card-profile "$CARD" "$NEW_PROFILE"
