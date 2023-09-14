#!/bin/bash
#output_dir="~/5head/attachments"
file_name=$(date +'%d-%m-%Y-%H:%M:%S').png
cp /tmp/e.png $1/$file_name
echo "$file_name"

