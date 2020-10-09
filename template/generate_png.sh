#!/bin/sh

SCRIPT_PATH=$(dirname $(realpath $0))
TEMP_HTML_PATH=$(mktemp --suffix=.html)

if [ "$#" -eq 3 ]; then
    sed -e "s/%TEXT1/$1/" -e "s/%TEXT2/$2/" "$SCRIPT_PATH/two-line.html" > "$TEMP_HTML_PATH"
    chromium --headless --screenshot="$3" --window-size=100,100 "$TEMP_HTML_PATH"
    rm $TEMP_HTML_PATH
    exit $?
fi

if [ "$#" -eq 2 ]; then
    sed -e "s/%TEXT/$1/" "$SCRIPT_PATH/one-line.html" > "$TEMP_HTML_PATH"
    chromium --headless --screenshot="$2" --window-size=100,100 "$TEMP_HTML_PATH"
    rm $TEMP_HTML_PATH
    exit $?
fi

echo "Usage: generate_png.sh (<TEXT>){1-2} <OUT_PATH>"
