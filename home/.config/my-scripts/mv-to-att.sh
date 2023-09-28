#!/bin/bash
source="$1"
target="/home/ju/5head/attachments/"

if [ -n "$2" ]; then
    mv "$source" "$target$2"
else
    mv "$source" "$target"
fi
