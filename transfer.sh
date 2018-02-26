#!/bin/bash

# Necessary variables
HASH=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c5)
FILEPATH=$(dirname "$1")
FILENAME=$(basename "$1")
EXTENSION="${FILENAME##*.}"
FILENAME="${FILENAME%.*}"

# The remote path to your webserver root directory
SKYNET_REMOTE="foobar@127.0.0.1:/var/www/html/skynet";

# The webserver from where you'll provide your files
SKYNET_URL="http://skynet.foobar.com/";

# If no filename was set, exit
if [ -z "$FILENAME" ]; then
    exit;
fi

# If chosen file is at the currenct directory, get the current directory path.
if [[ $FILEPATH = *"."* ]]; then
    FILEPATH=$PWD
fi

notify-send "Uploading $FILENAME.$EXTENSION..."

scp "$FILEPATH/$FILENAME.$EXTENSION" $SKYNET_REMOTE$HASH.$EXTENSION;

zenity --info --text="$SKYNET_URL$HASH.$EXTENSION";

exit;
