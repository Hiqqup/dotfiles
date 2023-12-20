#!/bin/bash

#mandatory filename
if [ "$#" -eq 0 ]; then
  echo "Usage: draw <filename>"
  exit 1
fi
#optional format
format="png"
if [ $# -ge 2 ]; then
  format="$2"
fi

if [ "$format" = "mv" ]; then
  if [ -z "$3" ]; then
    echo "Usage: draw <filename> mv <newname>"
    exit 1
  else
    file=("$1".*)
    ext="${file##*.}"
    new="$3.$ext"
    mv "$file" "$new"
    mv .$1.xopp .$3.xopp
  fi
else
  if [ ! -e ".$1.xopp" ]; then
    cp ~/.config/my-scripts/draw/template.xopp .$1.xopp
  fi

  echo "drawing..."
  xournalpp --class=draw .$1.xopp &>/dev/null
  case "$format" in
    "svg")
       xournalpp .$1.xopp -i $1.svg --export-no-background &>/dev/null
      ;;
    "png")
      xournalpp .$1.xopp -i $1.png --export-no-background --export-png-dpi 72 &>/dev/null
      ;;
    *)
      echo "Format $format not supported"
      ;;
  esac

  echo "Finished drawing and converted to $format"


fi
