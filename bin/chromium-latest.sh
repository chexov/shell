#!/bin/sh
set -x

rev=$(wget -O - http://commondatastorage.googleapis.com/chromium-browser-snapshots/Mac/LAST_CHANGE)
wget -O new_chromium-rel-mac.zip http://commondatastorage.googleapis.com/chromium-browser-snapshots/Mac/$rev/chrome-mac.zip
cmp new_chromium-rel-mac.zip chromium-rel-mac.zip
e=$?
case $e in 
    1)
    mv new_chromium-rel-mac.zip chromium-rel-mac.zip
    unzip -l chromium-rel-mac.zip
    open chromium-rel-mac.zip
    ;;
    *)
    mv new_chromium-rel-mac.zip chromium-rel-mac.zip
    ;;
esac

