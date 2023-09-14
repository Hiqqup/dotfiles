#!/bin/bash
rm /tmp/e.png
scrot -s /tmp/e.png
xclip -selection clipboard -t image/png -i /tmp/e.png
