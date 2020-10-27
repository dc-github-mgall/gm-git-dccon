#!/bin/bash
set -ex

SCRIPT_PATH=$(dirname $(realpath $0))
TEMP_HTML_PATH=$(mktemp --suffix=.html)

if [ -z "$SIZE" ]; then
    SIZE=100,100
fi

if [ -z "$FONT_SIZE" ]; then
    FONT_SIZE=18px
fi

if [ "$#" -eq 3 ]; then
    if [ "$2" = "--img" ]; then
        sed -e "s/%SIZE/$FONT_SIZE/" -e "s %TEXT $1 " "$SCRIPT_PATH/img.html" > "$TEMP_HTML_PATH"
    else
        sed -e "s/%SIZE/$FONT_SIZE/" -e "s/%TEXT1/$1/" -e "s/%TEXT2/$2/" "$SCRIPT_PATH/two-line.html" > "$TEMP_HTML_PATH"
    fi

    SCREENSHOT_PATH="$3"
fi

if [ "$#" -eq 2 ]; then
    sed -e "s/%SIZE/$FONT_SIZE/" -e "s/%TEXT/$1/" "$SCRIPT_PATH/one-line.html" > "$TEMP_HTML_PATH"
    SCREENSHOT_PATH="$2"
fi

chromium --headless --screenshot="$SCREENSHOT_PATH" --window-size="$SIZE" "$TEMP_HTML_PATH"
rm "$TEMP_HTML_PATH"
exit $?

echo "Usage: generate_png.sh (<TEXT>){1-2} <OUT_PATH>"
